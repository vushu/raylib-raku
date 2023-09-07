use lib 'lib';
unit class Build;
use Raylib::Generator;

method build($srcdir) {
    my $library_name = 'raylib';
    my $exitcode = shell("pkg-config --exists $library_name").exitcode;
    my $failed = $exitcode == 1;
    die "raylib is isn't installed, please install it" if $failed;

    my $build_dir="$srcdir/raylib-raku-c";

    say "Fetching raylib.h ....";
    shell("wget -q https://raw.githubusercontent.com/raysan5/raylib/master/src/raylib.h -O $build_dir/raylib.h");
    say "compiling raylib-raku-c library ...";
    die "Failed to compile raylib-raku-c files " if shell("cd $build_dir && gcc -c -fPIC $build_dir/raylib_pointerized_wrapper.c $build_dir/raylib_allocations.c").exitcode == 1;
    die "Failed to compile libraylib.so file " if shell("cd $build_dir && gcc -shared -o $build_dir/libraylib.so $build_dir/raylib_allocations.o $build_dir/raylib_pointerized_wrapper.o -lraylib").exitcode == 1;
    generate-bindings($build_dir);

}
