# NOT WORKING WIP.
use lib 'lib';
use NativeCall;
use Raylib::Bindings;

constant screen-width = 800;
constant screen-height = 450;

init-window(screen-width, screen-height, "Input example in Raku!");
my Camera3D $camera = Camera3D.new;

$camera.position = Vector3.new :x(0.0), :y(10.0), :z(10.0);
$camera.target = Vector3.new :x(0.0), :y(0.0), :z(0.0);
$camera.up = Vector3.new :x(0.0), :y(1.0), :z(0.0);
$camera.fovy = 45.0;
$camera.projection = 0;

my $cube-position = Vector3.new :x(0.0), :y(0.0), :z(0.0);


# my $ballPosition = Vector2.new(width=>screen-width/2, height=> screen-height/2);
my $white = nativecast(int, Color.new(:r(245), :g(245),:b(245), :a(255)));
my $red = nativecast(int, Color.new(:r(245), :g(0),:b(0), :a(255)));
# my $gray = Color.new(:r(245), :g(245),:b(245), :a(255));
# my $white = Color.new(r=>$r, g=>$g,b=>$b, a=>$a);

# my $color = 245 +< 24 +| 245 +< 16 +| 245 +< 8 +| 255;

#define RAYWHITE   CLITERAL(Color){ 245, 245, 245, 255 }   // My own White (raylib logo)
set-target-fps(60);
while (!window-should-close()) {
    begin-drawing;
    clear-background($white);
    begin-mode-3D($camera);

    draw-cube($cube-position, 2.0, 2.0, 2.0, $red);
    draw-grid(10, 1.0);
    end-mode-3D;
    draw-fps(10,10);
    end-drawing;
}
close-window;
