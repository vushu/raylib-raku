use lib 'lib';
use Raylib::Bindings;

#COLORS
my $white = Color.init(245, 245, 245, 255);
my $red = Color.init(230, 41, 55, 255); 
my $dark-gray = Color.init(80, 80, 80, 255);
my $maroon = Color.init(190, 33, 55, 255);

#Camera
my $position = Vector3.init(0.0.Num, 10.0.Num, 10.0.Num);
my $target = Vector3.init(0.0.Num, 0.0.Num, 0.0.Num);
my $up = Vector3.init(0.0.Num, 1.0.Num, 0.0.Num);
my $fovy = 45.0.Num;
my $projection = CameraProjection::CAMERA_PERSPECTIVE;
my $cube-position = Vector3.init(0.0.Num, 0.0.Num, 0.0.Num);
my $camera = Camera3D.init($position, $target, $up, $fovy, $projection);


init-window(800, 450, "raylib-raku");
set-target-fps(60);
while (!window-should-close) {
    begin-drawing;
    clear-background($white);
    begin-mode3d($camera);
    draw-cube($cube-position, 2.0.Num, 2.0.Num, 2.0.Num, $red);
    draw-cube-wires($cube-position, 2.0.Num, 2.0.Num, 2.0.Num, $maroon);
    draw-grid(10, 1.Num);
    end-mode3d;

    draw-text("Welcome to the third dimension!", 10, 40, 20, $dark-gray);
    draw-fps(10,10);
    end-drawing;
}
close-window;