## raylib-raku

### Prerequisite:
install raylib
https://github.com/raysan5/raylib

### Generating bindings from raylib.h
```
git clone git@github.com:vushu/raylib-raku.git
cd t
wget https://raw.githubusercontent.com/raysan5/raylib/master/src/raylib.h .
raku t/generate-bindings.rakutest > lib/Raylib.rakumod
```

#### Missing:
- raylib callbacks are yet to be implemented.
- support for other platforms other than linux


This is still a work in progress and bindings aren't perfect  
***help is appreciated!***