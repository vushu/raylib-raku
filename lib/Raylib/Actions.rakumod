class RaylibActions {
    has Str @.bindings;
    has @.type-map = "int" => "int32", "float" => "num32", "double" => "num64", "short" => "int16", "char"  => "Str", "bool" => "bool", "void" => "", "va_list" => "Str";
    has Int $!incrementer = 0;
    has @.ignored-functions = "SetTraceLogCallback",
        "SetLoadFileDataCallback", "SetSaveFileDataCallback",
        "SetLoadFileTextCallback", "SetSaveFileTextCallback",
        "SetAudioStreamCallback", "AttachAudioMixedProcessor",
        "DetachAudioMixedProcessor", "AttachAudioStreamProcessor",
        "DetachAudioStreamProcessor";


    method TOP ($/) {
    }

    method typedef-alias($/) {
        @.bindings.push("class $<identifier> is $($<type>.made) is export is repr('CStruct') \{\}");
    }

    method typedef-struct-forward($/){
        @.bindings.push("class $<identifier> is export is repr('CStruct') \{  has int32 \$.dummy;\}");
    }


    method typedef-callback($/) {
        #my $params = $<parameters>.made;
        #my $sub = "sub " ~ $<identifier>.made ~ "($params) is native(LIBRAYLIB)\{*\}";
        #@.bindings.push($sub);
    }

    method typedef-struct($/) {
        my $struct = "class $($<identifier>[0]) is export is repr('CStruct') ";
        my $b = $<block>.made;
        @.bindings.push($struct ~ "\{\n " ~ $b ~ '}');
    }

    method typedef-enum($/) {
        my $enum-decl = "enum $<identifier> is export";
        my $b = $<block>.made;
        @.bindings.push("$enum-decl (\n $b);");

    }

    method enum-var-decl($/) {
        if ($<value>.elems > 1)
        {
            make "   $($<value>[0]) => $($<value>[1]),\n";
        }
        else {
            $!incrementer = $!incrementer + 1;
            make "   $($<value>[0]) => $!incrementer,\n";
        }
    }

    method block($/) {
        $!incrementer = 0;
        my @block-data;
        for $<statement> -> $state {
            if ($state<var-decl>) {
                my $member = $state<var-decl>.made;
                @block-data.push($member);
            }
            if ($state<enum-var-decl>) {
                my $member = $state<enum-var-decl>.made;
                @block-data.push($member);
            }
        }
        make @block-data.Str;
    }

    method var-decl($/) {
        my @aaa;
        for $<identifier> -> $ident {
            my $unsigned = $<modifier>.map: *.made;
            if ($<pointer> && $<type> eq "void") {
                @aaa.push("   has Pointer[void] \$.$ident;\n");
            }
            else {

                my $defined-type;
                if $unsigned eq 'u' && $<type> eq 'char' {
                    $defined-type = 'uint8';
                }
                else {
                    $defined-type = $<type> eq 'char' ?? $<type>.made !! "$unsigned$($<type>.made)";
                }
                if $<pointer>
                {
                    @aaa.push("   has $defined-type \$.$ident is rw;\n");
                }
                else
                {
                    @aaa.push("   has $defined-type \$.$ident;\n");
                }
            }
        }
        for $<array-identifier> -> $arr-ident {
            @aaa.push("   has CArray[$($<type>.made)] $($arr-ident.made) is rw;\n");
        }
        make @aaa.Str;
    }

    method array-identifier($/) {
        my $arr = "\$.$<identifier>";
        make $arr;
    }

    method modifier($/) {
        if $<unsigned> {
            make 'u';
        }
        else {
            make '';
        }
    }

    method function($/) {
        if $<identifier>.made !∈ @.ignored-functions {
            @.bindings.push(self.gen-function($<type>, $<identifier>, $<parameters>.made));
        }
    }

    method get-return-type($return-type) {
        my $raku-type = $return-type<identifier> ?? $return-type<identifier>.made !! $return-type.made;
        if ($raku-type ne '') {
            return " returns $raku-type";
        }
        return ''
    }

    method camelcase-to-kebab(Str $camel-case) {
        my $kebab = $camel-case.subst(/(<:Lu><:Lu>?<:Ll>|\d+D|<:Lu>+)/, { '-' ~ .Str.lc }, :g);
        $kebab.=subst(/\-\d+d/, {.substr(1).lc}); # fixing 2d and 3d since kebab casing numbers istn't allowed
        return $kebab.substr(1);

    }

    method gen-function($return-type, $function-name, $parameters) {
        my $raku-type = self.get-return-type($return-type);
        my $kebab-case-name = self.camelcase-to-kebab($function-name.Str);
        return "our sub $kebab-case-name ($parameters)$raku-type is export is native(LIBRAYLIB) is symbol('$function-name')\{ * \}";
    }

    method parameters($/) {
        if (!$<type>) {
            make '';
            return;
        }
        my $type = ~$<type>.made;
        if $type eq '' {
            make "";
            return;
        }
        my $rest = $<parameters> ?? $<parameters>.map: *.made !! "";
        my $tail = "";
        if $rest {
            $tail = ',' ~ ' ' ~ $rest;
        }

        my $u = '';
        if $<pointer> && $<type> ne 'char' {
            make "$type \$$($<identifier> ?? "$<identifier> is rw" !! '')$tail";
        }
        else {
            make "$type \$$($<identifier> ?? $<identifier> !! '')$tail";
        }
    }

    method type($/) {
        if ($<identifier>) {
            make $<identifier>.made;
        }
        else {
            make %.type-map{~$/};
        }
    }

    method identifier($/) {
        make ~$/;
    }



}
