use lib 'lib';
use Grammar;
use Actions;

# get raylib.h file by running:
#wget https://raw.githubusercontent.com/raysan5/raylib/master/src/raylib.h .

sub generate-bindings {
    say "Generating raylib bindings...";
    my $parser = RaylibGrammar.new;
    my $actions = RaylibActions.new;
    my $raylib = slurp "generator/raylib.h";
    my $parsed = $parser.parse($raylib, actions => $actions);

    my $file  = open "lib/Raylib.rakumod", :w;

    $file.say("use NativeCall;");
    $file.say("constant LIBRAYLIB = '/usr/local/lib/libraylib.so';");
    for $actions.bindings -> $binding {
        $file.say($binding);
    }
    $file.close;
    say "Done generating raylib bindings!";
}
generate-bindings;