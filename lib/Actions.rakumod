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
        #say (make $<defined-content>.map: *.made);
    }

    method typedef-alias($/) {
        @.bindings.push("class $<identifier> is $($<type>.made) is repr('CStruct') \{\}");
    }

    method typedef-struct-forward($/){
        @.bindings.push("class $<identifier> is repr('CStruct') \{ has int32 \$.dummy;\}");
    }


    method typedef-callback($/) {
        #my $params = $<parameters>.made;
        #my $sub = "sub " ~ $<identifier>.made ~ "($params) is native(LIBRAYLIB)\{*\}";
        #@.bindings.push($sub);
    }

    method typedef-struct($/) {
        my $struct = "class $($<identifier>[0]) is repr('CStruct') ";
        my $b = $<block>.made;
        @.bindings.push($struct ~ "\{\n" ~ $b ~ '}');
    }

    method typedef-enum($/) {
        my $enum-decl = "enum $<identifier> is export";
        my $b = $<block>.made;
        @.bindings.push("$enum-decl (\n$b);");

    }

    method enum-var-decl($/) {
        if ($<value>.elems > 1)
        {
            make "$($<value>[0]) => $($<value>[1]),\n";
        }
        else {
            $!incrementer = $!incrementer + 1;
            make "$($<value>[0]) => $!incrementer,\n";
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
            if ($<pointer> && $<type> eq "void") {
                @aaa.push("   has Pointer[void] \$.$ident;\n");
            }
            else {
                @aaa.push("   has $($<type>.made) \$.$ident;\n");
            }
        }
        for $<array-identifier> -> $arr-ident {
            @aaa.push("   has CArray[$($<type>.made)] $($arr-ident.made);\n");
        }
        make @aaa.Str;
    }

    method array-identifier($/) {
        my $arr = "\$.$<identifier>";
        make $arr;
    }

    method function($/) {
        if $<identifier>.made !∈ @.ignored-functions {
            @.bindings.push(self.gen-function($<type>, $<identifier>, $<parameters>.made));
        }
    }

    method get-return-type($return-type) {
        my $raku-type = $return-type<identifier> ?? $return-type<identifier>.made !! $return-type.made;
        if ($raku-type ne '') {
            return " of $raku-type";
        }
        return ''
    }

    method gen-function($return-type, $function-name, $parameters) {
        my $raku-type = self.get-return-type($return-type);
        return "sub $function-name ($parameters)$raku-type is native(LIBRAYLIB)\{ * \}";
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

        make "$type \$$($<identifier> ?? $<identifier> !! '')$tail";
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