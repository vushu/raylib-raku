use lib 'lib';
use Raylib::Bindings;

InitWindow(800, 450, "Hello from Raku!");
while (!WindowShouldClose()) {
    BeginDrawing();
    EndDrawing();
}
CloseWindow();
