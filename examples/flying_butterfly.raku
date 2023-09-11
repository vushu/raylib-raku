use Raylib::Bindings;

constant $screen-width = 1024.Int;
constant $screen-height = 450.Int;
my $white = init-white;
my $background = init-skyblue;
init-window($screen-width, $screen-height, "raylib-raku");

my $string = "examples/camelia.png";
my $camelia = load-image($string);
my $texture = load-texture-from-image($camelia);
unload-image($camelia);

my $img-pos = Vector2.init(185.Num, ($screen-height/2.Num) - $texture.height/2 - 10);

set-target-fps(60);
while (!window-should-close) {
    $img-pos.y += sin(get-time() * 10) * 5;
    $img-pos.x += (sin(get-time() * 1.5) + cos(get-time() * 1.5)) * 6;

    begin-drawing;
    clear-background($background);

    draw-texture-v($texture, $img-pos, $white);

    end-drawing;
}
unload-texture($texture);
close-window;