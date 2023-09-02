# NOT WORKING WIP.
use lib 'lib';
use NativeCall;
use Raylib::Bindings;
use Raylib::Helpers;

constant screen-width = 1024;
constant screen-height = 648;

init-window(screen-width, screen-height, "Input example in Raku!");

class A is repr('CStruct') is rw {
    has int32 $.x;
}

class B is rw is repr('CStruct') {
    has A $.a is rw;
}

# sub MAIN() {
#     # my A $a .= new;
#     # my A $just-a .= new(:x(12));
#     my $p = nativecast(Pointer[A], A.new(x=>1));
#     $p;
# }


my $camera = Camera3D.new;
# my $vector = Vector3.new;
# $vector.x = 0.0.Num;
# $vector.y = 0.0.Num;
# $vector.z = 0.0.Num;
# # my $position = Vector3.new :x(0.0.Num), :y(10.0.Num), :z(10.0.Num);
# $camera.position = $vector;
# $camera.target = Vector3.new :x(0.0), :y(0.0), :z(0.0);
# $camera.up = Vector3.new :x(0.0), :y(1.0), :z(0.0);
# $camera.fovy = 45.0;
# $camera.projection = 0;

# my $cube-position = Vector3.new :x(0.0), :y(0.0), :z(0.0);


# # my $ballPosition = Vector2.new(width=>screen-width/2, height=> screen-height/2);
# my $white = nativecast(int, Color.new(:r(245), :g(245),:b(245), :a(255)));
# my $red = nativecast(int, Color.new(:r(245), :g(0),:b(0), :a(255)));
my $white = Color.new(:r(245), :g(245),:b(245), :a(255));
# # my $white = Color.new(r=>$r, g=>$g,b=>$b, a=>$a);

# # my $color = 245 +< 24 +| 245 +< 16 +| 245 +< 8 +| 255;
my $p = nativecast(Pointer[Color], $white);

# #define RAYWHITE   CLITERAL(Color){ 245, 245, 245, 255 }   // My own White (raylib logo)
set-target-fps(60);
while (!window-should-close()) {
    begin-drawing;
    # clear-background2($p);
    # begin-mode3d($camera);

#     draw-cube($cube-position, 2.0, 2.0, 2.0, $red);
#     draw-grid(10, 1.0);
    # end-mode3d;
    draw-fps(1000,10);
    end-drawing;
}
close-window;
