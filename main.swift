import ginseng
import raylib

raylib.InitWindow(800, 450, "hello world")
let RAYWHITE = raylib.Color(r:255,g:255,b:255,a:255)
let LIGHTGRAY = raylib.Color(r:128,g:128,b:128,a:255)

while !raylib.WindowShouldClose()
{
    raylib.BeginDrawing()
        raylib.ClearBackground(RAYWHITE)
        raylib.DrawText("Congrats! You created your first window!", 190, 200, 20, LIGHTGRAY)
    raylib.EndDrawing()
}
raylib.CloseWindow()


// compiling error
//var db = ginseng.database()