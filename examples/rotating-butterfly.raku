use Raylib::Bindings;

constant $screen-width = 1024;
constant $screen-height = 450;
my $white = Color.init(245, 245, 245, 255);
init-window($screen-width, $screen-height, "raylib-raku");

# LOADING Texture
my $string = "examples/camelia.png";
my Texture2D $camelia = load-texture($string);

my $frame-width = $camelia.width.Num;
my $frame-height = $camelia.height.Num;

my $source-rec = Rectangle.init(0e0, 0e0, $frame-width, $frame-height);
my $dest-rec = Rectangle.init($screen-width/2.0e0, $screen-height/2.0e0, $frame-width * 2e0, $frame-height * 2e0);
my $origin = Vector2.init($frame-width, $frame-height);
my $gray = Color.init(130, 130, 130, 255);

my $rotation = 0;

set-target-fps(60);
while !window-should-close {
    $rotation++;
    begin-drawing;
    clear-background($white);
    draw-texture-pro($camelia, $source-rec, $dest-rec, $origin, $rotation.Num, $white);
    draw-line($dest-rec.x.Int, 0, $dest-rec.x.Int, $screen-height, $gray);
    draw-line(0, $dest-rec.y.Int, $screen-width, $dest-rec.y.Int, $gray);
    draw-texture-pro($camelia, $source-rec, $dest-rec, $origin, $rotation.Num, $white);

    draw-fps(10,10);
    end-drawing;
}

unload-texture($camelia);
close-window;