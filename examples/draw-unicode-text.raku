use Raylib::Bindings;

my $black = init-black;
my $red = init-red;

my Str $text = "Αα Νν Ξξ Οο Ππ Ρρ Σσς Ττ Υυ "; # Important that the unicode is part ot the font or else it won't show.
my int32 $count = 0;
init-window(800, 450, "Draw Unicode");
my Str $file = "resources/fonts/dejavu.fnt"; # You can use .ttf or .fnt, but it seems like .fnt are better supported by Raylib.
my Font $font = load-font($file);

set-target-fps(60);

my $position = Vector2.init(130e0, 210e0);
while !window-should-close {
    begin-drawing;
        clear-background($black);
        draw-text-ex($font, $text, $position, 38e0, 2e0, $red);
    end-drawing;
}

close-window;
