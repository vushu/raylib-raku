unit module Raylib::Helpers:ver<0.0.1>:auth<zef:vushu>;
use NativeCall;
use Raylib::Bindings;

sub pack(Color $color) returns num32 is export {
# # my $color = 245 +< 24 +| 245 +< 16 +| 245 +< 8 +| 255;
    # my $uint32 = $color.r +< 24 +| $color.g +< 16 +| color.b +< 8 +| $color.a;
    return uint32;
}