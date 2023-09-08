class Pointerized {
    has Bool $.is-pointerized = False;
    has Str $.pointer-value = "*";
    multi method new ($is-pointerized, $pointer-value) { 
        self.bless(:$is-pointerized, :$pointer-value);
    }

    method Str() {
        return $.pointer-value;
    }

}

class RaylibActions {
    has Str @.bindings;
    has Str @.pointerized_bindings;
    has Str @.alloc_bindings;
    has Str @.c_pointerize_bindings;
    has Str @.c_pointerize_custom_binding;
    has Str @.c_alloc_funtions;
    has @.type-map = "int" => "int32", "float" => "num32", "double" => "num64", "short" => "int16", "char"  => "Str", "bool" => "bool", "void" => "void", "va_list" => "Str";
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
        my $struct-name = $<identifier>[0];
        my $struct = "class $($<identifier>[0]) is export is repr('CStruct') is rw ";
        my $b = $<block>.made;
        my @func-bundle = self.create-malloc-function($/);
        @.c_alloc_funtions.push(@func-bundle[0].join);
        my $raku-params = @func-bundle[1].join(',');
        # Extracting identifiers
        my $raku-identifiers = @func-bundle[1].map(-> $x {$x[1]}).join(',');

        my $malloc-func = "    method init\($raku-params\) returns $struct-name \{\n        malloc-$struct-name\($raku-identifiers\);\n    }";
        my $free-func = "    method free \{\n        free-$struct-name\(self\);\n    }";
        my $gc-auto-free-func = "    submethod DESTROY \{\n        free-$struct-name\(self\);\n    }";

        @.bindings.push($struct ~ "\{\n " ~ $b ~ $malloc-func ~"\n"~ $gc-auto-free-func ~"\n\}");
        @.c_alloc_funtions.push(self.create-free-function($/).join);
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
            my $return-is-type-value-type = $<type><identifier> && !$<pointer>;
            my $func = self.gen-function($<type>, $<identifier>, $<parameters>.made, $return-is-type-value-type);
            if ($!is-value-type || $return-is-type-value-type) { # checking return type also
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
                    @.c_pointerize_bindings.push($wrapped_func_call);
                }
                else {
                   $wrapped_func_call = $return-type ~ ' '~ $<identifier>~ '_pointerized(' ~ $pointerized-params ~ ")\{\n    $return-type ptr = malloc\(sizeof\($<type>\)\);\n    $<type> ret = $call-func \n    *ptr = ret; \n    return ptr;\n\}";
                    @.c_pointerize_bindings.push($wrapped_func_call);
                }
            }
            else { 
                @.bindings.push($func);
            }
        }
    }

    method create-free-function($struct) {
        my @free_function;
        @free_function.push("void free_$struct<identifier>[0]\($struct<identifier>[0]* ptr)\{\n");
        @free_function.push("   free(ptr);\n");
        @free_function.push("\}");
        return @free_function;

    }
    method create-malloc-function($struct) {
        my @parameters;
        my @raku-parameters;
        for $struct<block><statement> -> $x {
            if $x<var-decl><identifier> {
                for $x<var-decl><identifier> -> $ident {
                    @parameters.push(($x<var-decl><modifier>, $x<var-decl><type>, $x<var-decl><pointer>, $ident));
                    if ($x<var-decl><modifier> eq 'unsigned' && $x<var-decl><type> eq 'char') {
                        @raku-parameters.push(('uint8', "\$$ident"));
                    }
                    else {
                        @raku-parameters.push(($x<var-decl><type>.made, "\$$ident"));
                    }
                }
            }

            if $x<var-decl><array-identifier> { 
                # say $x<var-decl><array-identifier><identifier>;
                @parameters.push(($x<var-decl><modifier>, $x<var-decl><type>, $x<var-decl><pointer>, $x<var-decl><array-identifier>));
                @raku-parameters.push(('CArray[' ~ $x<var-decl><type>.made ~ ']', "\$$x<var-decl><array-identifier>[0]<identifier>"));
            }
        }

        my @pp = self.pointerize-parameter-list(@parameters);
        my $param-list = @pp.join(',').trim;
        # say @raku-parameters;
        my $raku-param-list = @raku-parameters.join(',').trim;

        # print "($param-list)";
        my @malloc_function;
        my $struct-name = $struct<identifier>.first.Str;
        @.alloc_bindings.push("our sub malloc-$struct-name\($raku-param-list\) returns $struct-name is native(LIBRAYLIB) is symbol('malloc_$struct-name') \{*\}");
        @.alloc_bindings.push("our sub free-$struct-name\($struct-name \$ptr) is native(LIBRAYLIB) is symbol('free_$struct-name') \{*\}");
        @malloc_function.push($struct<identifier>.first.Str ~ '* '~ "malloc_" ~ $struct<identifier>.first.Str ~ "($param-list) \{\n");
        @malloc_function.push("   $struct<identifier>[0]* ptr = malloc(sizeof($struct<identifier>[0]));\n");
        for @pp -> $pv {
            my $identifier-name = $pv[3][0] ?? $pv[3][0]<identifier> !! $pv[3];
            # checking if it's an array
            if ($pv[3][0]<identifier>) {
                #using memcpy
                @malloc_function.push("   memcpy(ptr->$identifier-name, $identifier-name, $pv[3][0]<index> * sizeof($pv[1]));\n");
            }
            elsif ($pv[1]<identifier> && $pv[2].is-pointerized) {
                @malloc_function.push("   ptr->$identifier-name = $pv[2]$identifier-name;\n");
            }
            else {
                @malloc_function.push("   ptr->$identifier-name = $identifier-name;\n");
            }
        }
        @malloc_function.push("   return ptr;\n");
        @malloc_function.push("\}");
        return @malloc_function, @raku-parameters;


    }

    method pointerize-parameter-list(@parameters) {
        my @pointerized-params;

        for @parameters -> $p { 
            if $p[1]<identifier> && !$p[2] {
                @pointerized-params.push(($p[0], $p[1], Pointerized.new(True, '*'), $p[3]));
            }
            else {
               my $pointer = $p[2].Str.subst(' ','');
               @pointerized-params.push(($p[0], $p[1], Pointerized.new(False, $pointer), $p[3]));
            }
        }
        return @pointerized-params;

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
        if $parameters eq 'void' {
            return "";
        }
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
            return "$const$modifier $($parameters<type>) $parameters<pointer> $parameters<identifier>" ~ $tail;
        }
        else {
            @current-identifiers.unshift((~$parameters<type>, $parameters<identifier>, False));
            return "$($parameters<type>) $parameters<identifier>" ~ $tail;
        }
    }

    method get-return-type($return-type) {
        my $raku-type = $return-type<identifier> ?? $return-type<identifier>.made !! $return-type.made;
        if ($raku-type ne 'void') {
            # no returns on void type
            return " returns $raku-type";
        }
        return ''
    }

    method camelcase-to-kebab(Str $camel-case) {
        my $kebab = $camel-case.subst(/(<:Lu><:Lu>?<:Ll>|\d+D|<:Lu>+)/, { '-' ~ .Str.lc }, :g);
        $kebab.=subst(/\-\d+d/, {.substr(1).lc}); # fixing 2d and 3d since kebab casing numbers isn't allowed
        return $kebab.substr(1);

    }

    method gen-function($return-type, $function-name, $parameters, $return-is-type-value-type) {
        my $pointerize = ($!is-value-type || $return-is-type-value-type) ?? '_pointerized' !! '';
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
        if $type eq 'void' {
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
