use lib 'lib';
use Raylib::Bindings;

init-window(800, 450, "Hello from Raku!");
my $white = Color.new(:r(245), :g(245),:b(245), :a(255));
while (!window-should-close) {
    begin-drawing;

    draw-fps(100,10);
    end-drawing;
}
close-window;