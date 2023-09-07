use lib 'lib';
use Raylib::Bindings;
use NativeCall;

constant $screen-width = 800;
constant $screen-height = 450;

my $white = Color.init(245, 245, 245, 255);

my $string = "examples/camelia.png";

init-window($screen-width, $screen-height, $string);

# Loading image ------
my $camelia = load-image($string);
my $texture = load-texture-from-image($camelia);
unload-image($camelia);

my $img-pos = Vector2.init($screen-width/2.Num, ($screen-height/2.Num) - $texture.height/2 - 20.Num);

set-target-fps(60);
while (!window-should-close) {
    begin-drawing;
    clear-background($white);

    draw-texture-v($texture, $img-pos, $white);

    draw-fps(10,10);
    end-drawing;
}
unload-texture($texture);
close-window;