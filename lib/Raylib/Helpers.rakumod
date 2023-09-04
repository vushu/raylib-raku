unit module Raylib::Helpers:ver<0.0.1>:auth<zef:vushu>;
use NativeCall;
use Raylib::Bindings;

constant LIBRAYLIB = '/home/mirdavu/code/raku/raylib-raku/generator/libraylib.so.4.5.0';

sub init-color(uint8 $r, uint8 $g, uint8 $b, uint8 $a) returns Color is export is native(LIBRAYLIB) is symbol('init_color'){
    *
}

sub free-color(Color $color) is export is native(LIBRAYLIB) is symbol('free_color'){
    *
}
sub clear-background-ptr(Color $color) is export is native(LIBRAYLIB) is symbol('ClearBackground_pointerized'){
    *
}

