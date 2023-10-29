use Raylib::Grammar;
use Raylib::Actions;

constant generation-message = "# This Raku module is generated from raylib.h";

sub generate-bindings($raylib-h-file, $output-dir) is export {
    say "Generating raylib bindings...";
    my $parser = RaylibGrammar.new;
    my $actions = RaylibActions.new;
    my $raylib = slurp $raylib-h-file;
    my $parsed = $parser.parse($raylib, actions => $actions);

    my $file  = open "lib/Raylib/Bindings.rakumod", :w;
    $file.say(generation-message);
    $file.say("unit module Raylib::Bindings:ver<0.0.7>:auth<zef:vushu>;");
    $file.say("use NativeCall;");
    $file.say("constant LIBRAYLIB = %\?RESOURCES<libraries/raylib>;");
    for $actions.bindings -> $binding {
        $file.say($binding);
    }

    $file.say("####### Predefined colors ########");
    for $actions.predifined-colors -> $binding {
        $file.say($binding);
    }

    $file.say("####### Pointerized functions ########");
    for $actions.pointerized_bindings -> $binding {
        $file.say($binding);
    }

    $file.say("####### Allocation functions ########");
    for $actions.alloc_bindings -> $binding {
        $file.say($binding);
    }

    $file.close;

    my $wrapper_file  = open "$output-dir/raylib_pointerized_wrapper.c", :w;
    $wrapper_file.say("// This file is generated by raylib-raku");
    $wrapper_file.say("#include <raylib.h>");
    $wrapper_file.say("#include <stdlib.h>");

    for $actions.c_pointerize_bindings -> $binding {
        $wrapper_file.say($binding);
    }
    $wrapper_file.close;

    my $alloc_file  = open "$output-dir/raylib_allocations.c", :w;
    $alloc_file.say("// This file is generated by raylib-raku");
    $alloc_file.say("#include <raylib.h>");
    $alloc_file.say("#include <stdlib.h>");
    $alloc_file.say("#include <string.h>");

    for $actions.c_alloc_funtions -> $binding {
        $alloc_file.say($binding);
    }
    $alloc_file.close;
    say "Done generating raylib bindings!";
}



sub MAIN {
    generate-bindings($*CWD);
}