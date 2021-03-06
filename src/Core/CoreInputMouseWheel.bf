/*******************************************************************************************
*
*   raylib [core] examples - Mouse wheel input
*
*   This test has been created using raylib 1.1 (www.raylib.com)
*   raylib is licensed under an unmodified zlib/libpng license (View raylib.h for details)
*
*   Copyright (c) 2014 Ramon Santamaria (@raysan5)
*
********************************************************************************************/

using raylib_beef;
using raylib_beef.Types;
using System;
using System.Collections;

namespace raylib_beef_examples.Core
{
	class InputMouseWheel : Raylib
	{
		public static void Main()
		{
			let screenWidth = 800;
			let screenHeight = 450;

			InitWindow(screenWidth, screenHeight, "raylib [core] example - input mouse wheel");
			defer CloseWindow();

			int32 boxPositionY = screenHeight / 2 - 40;
			let scrollSpeed = 4;

			SetTargetFPS(60);

			while (!WindowShouldClose())
			{
				Update:
				{
					boxPositionY -= (int32)(GetMouseWheelMove() * scrollSpeed);
				}

				Draw:
				{
					BeginDrawing();
					defer EndDrawing();

					ClearBackground(.RAYWHITE);

					DrawRectangle(screenWidth / 2 - 40, boxPositionY, 80, 80, .MAROON);

					DrawText("Use the mouse wheel to move the cube up and down!", 10, 10, 20, .GRAY);

					// had to make boxPositionY an int32 instead of int (which is really int64 on my system)
					// otherwise, really weird numbers were printed here
					var positionInfo = (scope $"Box position Y: {boxPositionY}");

					// TextFormat() seems not to do anything in Beef -> deleted
					DrawText(positionInfo.CStr(), 10, 40, 20, .LIGHTGRAY);
				}
			}
		}
	}
}
