## raylib-raku
RaylibGrammar implemented.
Autogenerating bindings are still W.I.P.

```
use Raylib;
InitWindow(800, 450, "hello");
while (!WindowShouldClose()) {
    BeginDrawing();
    EndDrawing();
}
CloseWindow();

```
Testing and generating bindings
``cd t
``wget https://raw.githubusercontent.com/raysan5/raylib/master/src/raylib.h .
``raku t/generate-bindings.rakutest > lib/Raylib.rakumod
