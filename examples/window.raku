use lib 'lib';
use Raylib::Bindings;
use NativeCall;

my $white = Color.init(245, 245, 245, 255);
my $string = "FOO";
my $array = CArray[uint8].new($string.encode.list, 0);
init-window(800, 450, $array);
set-target-fps(60);
while (!window-should-close) {
    begin-drawing;
    clear-background($white);

    draw-fps(10,10);
    end-drawing;
}
close-window;