class RaylibActions {
    has Str @.bindings;
    has Str @.pointerized_bindings;
    has Str @.c_pointerize_bindings;
    has Str @.c_pointerize_custom_binding;
    has @.type-map = "int" => "int32", "float" => "num32", "double" => "num64", "short" => "int16", "char"  => "Str", "bool" => "bool", "void" => "", "va_list" => "Str";
    # has @.value-typed-data = "Color" => "uint32";
    has Bool $!is-value-type = False;
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
        my $struct = "class $($<identifier>[0]) is export is repr('CStruct') is rw ";
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
            my $func = self.gen-function($<type>, $<identifier>, $<parameters>.made);
            if ($!is-value-type) {
                $!is-value-type = False;
                @.pointerized_bindings.push($func);
                my @current-identifiers;
                my $pointerized-params = self.pointerize-parameters($<parameters>, @current-identifiers);
                my $call-func = self.create-call-func(@current-identifiers, ~$<identifier>);
                my $normal-type-return = "$<type>" ~ ($<pointer> ?? "*" !! '');
                my $pointerized-return = self.create-pointerized-return-type($/);
                my $return-type = $pointerized-return[0];
                my $is-normal-return = !$pointerized-return[1];
                my $wrapped_func_call;
                if ($is-normal-return) {
                    if ($<type> eq 'void') {
                        $wrapped_func_call = $return-type ~ ' '~ $<identifier>~ '_pointerized(' ~ $pointerized-params ~ ")\{ $call-func \}";
                    }
                    else {
                        $wrapped_func_call = $return-type ~ ' '~ $<identifier>~ '_pointerized(' ~ $pointerized-params ~ ")\{ return $call-func \}";
                    }
                    @.c_pointerize_bindings.push($wrapped_func_call); # say 'CURRENT IDENTIFIERS ',  @current-identifiers;
                }
                else {
                   $wrapped_func_call = $return-type ~ ' '~ $<identifier>~ '_pointerized(' ~ $pointerized-params ~ ")\{\n    $return-type pointer_value = malloc\(sizeof\($<type>\)\);\n    $<type> ret = $call-func \n    *pointer_value = ret; \n    return pointer_value;\n\}";
                    @.c_pointerize_bindings.push($wrapped_func_call); # say 'CURRENT IDENTIFIERS ',  @current-identifiers;
                    # @.c_pointerize_custom_binding.push($wrapped_func_call); # say 'CURRENT IDENTIFIERS ',  @current-identifiers;
                }
            }
            else { 
                @.bindings.push($func);
            }
        }
    }

    method create-pointerized-return-type($function) {
        if ($function<type><identifier> && $function<pointer>) {
            #already pointer no change is needed
            return  ("$function<type>$function<pointer>", False);
        }
        elsif $function<type><identifier> && !$function<pointer>  {
            #value type pointerized
            return ("$function<type><identifier>" ~ "*", True);
        }
        return ("$function<type>$function<pointer>", False);

    }

    method create-call-func(@current-identifiers, $identifier) {
        my $call-func = $identifier ~ '(';
        my $idx = 0;
        for @current-identifiers -> $ident {
            my $add-comma = $idx gt 0 ?? ', ' !! '';
            # need to deref True of False?
            if ($ident[2]) {
                $call-func ~= ($add-comma ~ "*$ident[1]");
            }
            else {
                $call-func ~= ($add-comma ~ "$ident[1]");
            }
            $idx++;
        }
        $call-func ~= ");";
        return $call-func;

    }

    method pointerize-parameters($parameters, @current-identifiers) {
        my $tail = "";
        my $rest = $parameters<parameters> ?? $parameters<parameters>.map(-> $p {self.pointerize-parameters($p, @current-identifiers)}) !! "";
        if $rest {
            $tail = ',' ~ ' ' ~ $rest;
        }


        if ($parameters<type><identifier> && !$parameters<pointer>) {
            @current-identifiers.unshift((~$parameters<type>, ~$parameters<identifier>, True));
            return "$($parameters<type>)* $parameters<identifier>" ~ $tail;
        }
        elsif ($parameters<pointer> && $parameters<type>) {
            @current-identifiers.unshift((~$parameters<type>, ~$parameters<identifier>, False));
            my $modifier = $<parameters><modifier> ?? $<parameters><modifier> !! '';
            my $const = $<parameters><const> ?? 'const ' !! '';
            return "$const$modifier $($parameters<type>)* $parameters<identifier>" ~ $tail;
        }
        else {
            @current-identifiers.unshift((~$parameters<type>, ~$parameters<identifier>, False));
            return "$($parameters<type>) $parameters<identifier>" ~ $tail;
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
        my $pointerize = $!is-value-type ?? '_pointerized' !! '';
        my $params = $parameters;
        my $raku-type = self.get-return-type($return-type);
        my $kebab-case-name = self.camelcase-to-kebab($function-name.Str);
        return "our sub $kebab-case-name ($params)$raku-type is export is native(LIBRAYLIB) is symbol('$function-name$pointerize')\{ * \}";
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
            # if defined %.value-typed-data{~$type}
            if $<type><identifier>
            {
                $!is-value-type = True;
                make "$type \$$($<identifier> ?? $<identifier> !! '')$tail";
            }
            else
            {
                make "$type \$$($<identifier> ?? $<identifier> !! '')$tail";
            }
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
