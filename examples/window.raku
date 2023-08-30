use lib 'lib';
use Raylib::Bindings;

init-window(800, 450, "Hello from Raku!");
while (!window-should-close) {
    begin-drawing;
    end-drawing;
}
close-window;