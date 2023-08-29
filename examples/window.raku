use lib 'lib';
use Raylib;

InitWindow(800, 450, "Hello from Raku!");
while (!WindowShouldClose()) {
    BeginDrawing();
    EndDrawing();
}
CloseWindow();
