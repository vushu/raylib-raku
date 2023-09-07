use lib 'lib';
use Raylib::Bindings;

my $p = Color.init(245, 245, 245, 255);
init-window(800, 450, "Hello from Raku!");
set-target-fps(60);
while (!window-should-close) {
    begin-drawing;
    clear-background($p);

    draw-fps(10,10);
    end-drawing;
}
close-window;