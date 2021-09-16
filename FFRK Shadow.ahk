#NoEnv
#SingleInstance Force
#WinActivateForce
Menu, Tray, Icon, %A_ScriptDir%\images\FFRK.ico
SetWorkingDir %A_ScriptDir% ;Sets the working directory where the script is actually located.
CoordMode, Pixel, Screen
CoordMode, Mouse, Screen
SendMode Input ;More reliable sending mode



;
ReturnMouse=yes ;Returns the mouse to the position it was at before clicking on the emulator


Pause ;Script begins paused
Gosub, TheMainLoop

F1::
;Press F1 to start and stop your script
Pause, Toggle
Gosub, TheMainLoop
Return

F2::
;Press F2 to force close script at anytime.
ExitApp
Return

ClickOnFoundImage:
MouseGetPos, ReturnX, ReturnY
WinGet, Active_ID, ID, A
Click, %FoundX%, %FoundY%, Left
If (ReturnMouse="yes")
	{
	Click, %ReturnX%, %ReturnY%, 0
	WinActivate ahk_id %Active_ID%
	}
Return

TheMainLoop:
Loop
	{
	Sleep 100
	ImageSearch, FoundX, FoundY, 0, 0, A_ScreenWidth, A_ScreenHeight, *80 %A_ScriptDir%\images\tran.png
	If (ErrorLevel = 0)
		{
		;This "Move On" button is slightly different than the other "Move On" button and requires its own image.
		Gosub, ClickOnFoundImage
		Sleep 1000
		}
 	ImageSearch, FoundX, FoundY, 0, 0, A_ScreenWidth, A_ScreenHeight, *80 %A_ScriptDir%\images\instab.png
	If (ErrorLevel = 0)
		{
		;This "Move On" button is slightly different than the other "Move On" button and requires its own image.
		Gosub, ClickOnFoundImage
		Sleep 1000
		}	
 	ImageSearch, FoundX, FoundY, 0, 0, A_ScreenWidth, A_ScreenHeight, *80 %A_ScriptDir%\images\bbatt.png
	If (ErrorLevel = 0)
		{
		;This "Move On" button is slightly different than the other "Move On" button and requires its own image.
		Gosub, ClickOnFoundImage
		Sleep 1000
		}
	ImageSearch, FoundX, FoundY, 0, 0, A_ScreenWidth, A_ScreenHeight, *80 %A_ScriptDir%\images\next.png
	If (ErrorLevel = 0)
		{
		;This "Move On" button is slightly different than the other "Move On" button and requires its own image.
		Gosub, ClickOnFoundImage
		Sleep 1000
		}
	ImageSearch, FoundX, FoundY, 0, 0, A_ScreenWidth, A_ScreenHeight, *80 %A_ScriptDir%\images\skip.png
	If (ErrorLevel = 0)
		{
		;This "Move On" button is slightly different than the other "Move On" button and requires its own image.
		Gosub, ClickOnFoundImage
		Sleep 1000
		}
 	}
 	
Return


