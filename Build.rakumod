use lib 'lib';
unit class Build;
use Raylib::Generator;

method build($srcdir) {
    my $library_name = 'raylib';
    my $exitcode = shell("pkg-config --exists $library_name").exitcode;
    my $failed = $exitcode == 1;
    die "raylib is isn't installed, please install it" if $failed;

    my $output-dir="$srcdir/raylib-raku/lib";
    my $raylib-h-file = "/usr/local/include/raylib.h";
    mkdir($output-dir);
    generate-bindings($raylib-h-file, $output-dir);

    say "compiling raylib-raku-c library ...";
    die "Failed to compile raylib-raku-c files " if shell("cd $output-dir && gcc -c -fPIC $output-dir/raylib_pointerized_wrapper.c $output-dir/raylib_allocations.c").exitcode == 1;
    die "Failed to compile libraylib.so file " if shell("cd $output-dir && gcc -shared -o $output-dir/libraylib.so $output-dir/raylib_allocations.o $output-dir/raylib_pointerized_wrapper.o -lraylib").exitcode == 1;
    say "All done 👌";

}
