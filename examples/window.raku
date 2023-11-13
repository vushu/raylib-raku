use Raylib::Bindings;

my $white = Color.init(245, 245, 245, 255);
init-window(800, 450, "Raylib window in Raku!");
set-target-fps(60);
while !window-should-close {
    begin-drawing;
    clear-background($white);

    draw-fps(10,10);
    end-drawing;
}
close-window;