#NoEnv
#SingleInstance Force
#WinActivateForce
Menu, Tray, Icon, %A_ScriptDir%\images\FFRK.ico
SetWorkingDir %A_ScriptDir% ;Sets the working directory where the script is actually located.
CoordMode, Pixel, Screen
CoordMode, Mouse, Screen
SendMode Input ;More reliable sending mode



;Paitings Priority
;Change the numbers to change the order
;Remove "painting_boss" if you want to choose a different team for the boss battle
Priority1=painting_treasure
Priority3=painting_combatred
Priority2=painting_exploration
Priority6=painting_onslaught
Priority7=painting_restoration
Priority4=painting_combatorange
Priority5=painting_combatgreen
Priority8=painting_portal
Priority9=painting_portal2
Priority0=painting_boss
Priority10=painting_boss2

TheAlarm=F:\Alarm01.wav

ReturnMouse=yes ;Returns the mouse to the position it was at before clicking on the emulator
OpenSealedDoor=yes


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
	ImageSearch, FoundX, FoundY, 0, 0, A_ScreenWidth, A_ScreenHeight, *80 %A_ScriptDir%\images\labyrinth_blue.png
	If (ErrorLevel = 0)
		{
		;Only use the painting priority loop when inside main labyrinth to prevent the script from cycling too early and choosing the wrong painting.
		Sleep 1000
		Gosub, PaintingPriority
		}
	ImageSearch, FoundX, FoundY, 0, 0, A_ScreenWidth, A_ScreenHeight, *80 %A_ScriptDir%\images\labyrinth_purple.png
	If (ErrorLevel = 0)
		{
		;Last floor is purple. Only use the painting priority loop when inside main labyrinth to prevent the script from cycling too early and choosing the wrong painting.
		Sleep 1000
		Gosub, PaintingPriority
		}	
	ImageSearch, FoundX, FoundY, 0, 0, A_ScreenWidth, A_ScreenHeight, *80 %A_ScriptDir%\images\treasureroom.png
	If (ErrorLevel = 0) ;Tesoro, apretar el cofre del medio
		{
		ImageSearch, FoundX, FoundY, 0, 0, A_ScreenWidth, A_ScreenHeight, *80 %A_ScriptDir%\images\chest.png
			If (ErrorLevel = 0)
				{
				Gosub, ClickOnFoundImage
				Sleep 1000
				}
				}
		ImageSearch, FoundX, FoundY, 0, 0, A_ScreenWidth, A_ScreenHeight, *80 %A_ScriptDir%\images\bok.png
	If (ErrorLevel = 0) ;ok cafe
		{
		Gosub, ClickOnFoundImage
		Sleep 1000
		}
	ImageSearch, FoundX, FoundY, 0, 0, A_ScreenWidth, A_ScreenHeight, *80 %A_ScriptDir%\images\bclose.png
	If (ErrorLevel = 0)
		{
		Gosub, ClickOnFoundImage
		Sleep 1000
		}
	ImageSearch, FoundX, FoundY, 0, 0, A_ScreenWidth, A_ScreenHeight, *80 %A_ScriptDir%\images\start.png
	If (ErrorLevel = 0) ; entrar en el laberinto, inicio p3
		{
		Gosub, ClickOnFoundImage
		Sleep 1000
		}
	ImageSearch, FoundX, FoundY, 0, 0, A_ScreenWidth, A_ScreenHeight, *80 %A_ScriptDir%\images\open.png
	If (ErrorLevel = 0) ; confirmacion cofre
		{
		Gosub, ClickOnFoundImage
		Sleep 1000
		}
	ImageSearch, FoundX, FoundY, 0, 0, A_ScreenWidth, A_ScreenHeight, *80 %A_ScriptDir%\images\exploring.png
	If (ErrorLevel = 0)
		{
		Gosub, ClickOnFoundImage
		Sleep 1000
		}
;anular la siguiente linea para cancelar la confirmacion del uso de las llaves
	ImageSearch, FoundX, FoundY, 0, 0, A_ScreenWidth, A_ScreenHeight, *80 %A_ScriptDir%\images\key conf.png
	If (ErrorLevel = 0)
		{
		ImageSearch, FoundX, FoundY, 0, 0, A_ScreenWidth, A_ScreenHeight, *80 %A_ScriptDir%\images\key.png
			If (ErrorLevel = 0)
				{
				Gosub, ClickOnFoundImage
				Sleep 1000
				}
			}

	ImageSearch, FoundX, FoundY, 0, 0, A_ScreenWidth, A_ScreenHeight, *80 %A_ScriptDir%\images\enterdungeon.png
	If (ErrorLevel = 0)
		{
		Gosub, ClickOnFoundImage
		Sleep 1000
		}
	ImageSearch, FoundX, FoundY, 0, 0, A_ScreenWidth, A_ScreenHeight, *80 %A_ScriptDir%\images\senterdungeon.png
	If (ErrorLevel = 0)
		{
		Gosub, ClickOnFoundImage
		Sleep 1000
		}
	ImageSearch, FoundX, FoundY, 0, 0, A_ScreenWidth, A_ScreenHeight, *80 %A_ScriptDir%\images\2enterdungeon.png
	If (ErrorLevel = 0)
		{
		Gosub, ClickOnFoundImage
		Sleep 1000
		}
	ImageSearch, FoundX, FoundY, 0, 0, A_ScreenWidth, A_ScreenHeight, *80 %A_ScriptDir%\images\chest2.png
		If (ErrorLevel = 0) ; segundo cofre
			{
			Gosub, ClickOnFoundImage
			Sleep 1000
			}
	ImageSearch, FoundX, FoundY, 0, 0, A_ScreenWidth, A_ScreenHeight, *80 %A_ScriptDir%\images\go.png
	If (ErrorLevel = 0)
		{
		Gosub, ClickOnFoundImage
		Sleep 1000
		}
	ImageSearch, FoundX, FoundY, 0, 0, A_ScreenWidth, A_ScreenHeight, *80 %A_ScriptDir%\images\ok.png
	If (ErrorLevel = 0)
		{
		Gosub, ClickOnFoundImage
		Sleep 1000
		}
	ImageSearch, FoundX, FoundY, 0, 0, A_ScreenWidth, A_ScreenHeight, *80 %A_ScriptDir%\images\explorationpainting.png
	If (ErrorLevel = 0)
		{
		ImageSearch, FoundX, FoundY, 0, 0, A_ScreenWidth, A_ScreenHeight, *80 %A_ScriptDir%\images\moveon.png
		If (ErrorLevel = 0)
			{
			;This "Move On" button is only clicked when inside an "Exploration Painting" to prevent the script from clicking on the "Move On" button while inside a "Treasure Painting"
			Gosub, ClickOnFoundImage
			Sleep 1000
			}
		}
	ImageSearch, FoundX, FoundY, 0, 0, A_ScreenWidth, A_ScreenHeight, *80 %A_ScriptDir%\images\restoration.png
	If (ErrorLevel = 0)
		{
		ImageSearch, FoundX, FoundY, 0, 0, A_ScreenWidth, A_ScreenHeight, *80 %A_ScriptDir%\images\moveon.png
		If (ErrorLevel = 0)
			{
			;This "Move On" button is only clicked when inside an "Restoration Painting" to prevent the script from clicking on the "Move On" button while inside a "Treasure Painting"
			Gosub, ClickOnFoundImage
			Sleep 1000
			}
		}
	ImageSearch, FoundX, FoundY, 0, 0, A_ScreenWidth, A_ScreenHeight, *80 %A_ScriptDir%\images\moveon_onslaught.png
	If (ErrorLevel = 0)
		{
		;This "Move On" button is slightly different than the other "Move On" button and requires its own image.
		Gosub, ClickOnFoundImage
		Sleep 1000
		}
		
	ImageSearch, FoundX, FoundY, 0, 0, A_ScreenWidth, A_ScreenHeight, *80 %A_ScriptDir%\images\skip.png
	If (ErrorLevel = 0)
		{
		Gosub, ClickOnFoundImage
		Sleep 1000
		}
	ImageSearch, FoundX, FoundY, 0, 0, A_ScreenWidth, A_ScreenHeight, *80 %A_ScriptDir%\images\next.png
	If (ErrorLevel = 0)
		{
		Gosub, ClickOnFoundImage
		Sleep 1000
		}
	ImageSearch, FoundX, FoundY, 0, 0, A_ScreenWidth, A_ScreenHeight, *80 %A_ScriptDir%\images\sealeddoor.png
	If (ErrorLevel = 0)
		{
		If (OpenSealedDoor="yes")
			{
			ImageSearch, FoundX, FoundY, 0, 0, A_ScreenWidth, A_ScreenHeight, *80 %A_ScriptDir%\images\yes.png
			If (ErrorLevel = 0)
				{
				;Only click on "Yes" when presented with a Sealed Door.
				Gosub, ClickOnFoundImage
				Sleep 1000
				}
			}
		If (OpenSealedDoor="no")
			{
			ImageSearch, FoundX, FoundY, 0, 0, A_ScreenWidth, A_ScreenHeight, *80 %A_ScriptDir%\images\no.png
			If (ErrorLevel = 0)
				{
				;Only click on "no" when presented with a Sealed Door.
				Gosub, ClickOnFoundImage
				Sleep 1000
				}
			}
		}
	ImageSearch, FoundX, FoundY, 0, 0, A_ScreenWidth, A_ScreenHeight, *80 %A_ScriptDir%\images\close.png
	If (ErrorLevel = 0)
		{
		Gosub, ClickOnFoundImage
		Sleep 1000
		}	
	ImageSearch, FoundX, FoundY, 0, 0, A_ScreenWidth, A_ScreenHeight, *80 %A_ScriptDir%\images\ffrkapp.png
	If (ErrorLevel = 0) ;Cargar app inicio 1
		{
		Gosub, ClickOnFoundImage
		Sleep 1000
		}
	ImageSearch, FoundX, FoundY, 0, 0, A_ScreenWidth, A_ScreenHeight, *80 %A_ScriptDir%\images\play.png
	If (ErrorLevel = 0) ; Apretar play, en el inicio2 
		{
		Gosub, ClickOnFoundImage
		Sleep 1000
		}
	ImageSearch, FoundX, FoundY, 0, 0, A_ScreenWidth, A_ScreenHeight, *80 %A_ScriptDir%\images\lab.png
	If (ErrorLevel = 0)
		{
		Gosub, ClickOnFoundImage
		Sleep 1000
		}
	}
Return


PaintingPriority:
	ImageSearch, FoundX, FoundY, 0, 0, A_ScreenWidth, A_ScreenHeight, *80 %A_ScriptDir%\images\%Priority1%.png
	If (ErrorLevel = 0)
		{
		Gosub, ClickOnFoundImage
		Sleep 1000
		Gosub, ClickOnFoundImage
		Sleep 1000
		}
	ImageSearch, FoundX, FoundY, 0, 0, A_ScreenWidth, A_ScreenHeight, *80 %A_ScriptDir%\images\%Priority2%.png
	If (ErrorLevel = 0)
		{
		Gosub, ClickOnFoundImage
		Sleep 1000
		Gosub, ClickOnFoundImage
		Sleep 1000
		}
	ImageSearch, FoundX, FoundY, 0, 0, A_ScreenWidth, A_ScreenHeight, *80 %A_ScriptDir%\images\%Priority3%.png
	If (ErrorLevel = 0)
		{
		Gosub, ClickOnFoundImage
		Sleep 1000
		Gosub, ClickOnFoundImage
		Sleep 1000
		}
	ImageSearch, FoundX, FoundY, 0, 0, A_ScreenWidth, A_ScreenHeight, *80 %A_ScriptDir%\images\%Priority4%.png
	If (ErrorLevel = 0)
		{
		Gosub, ClickOnFoundImage
		Sleep 1000
		Gosub, ClickOnFoundImage
		Sleep 1000
		}
	ImageSearch, FoundX, FoundY, 0, 0, A_ScreenWidth, A_ScreenHeight, *80 %A_ScriptDir%\images\%Priority5%.png
	If (ErrorLevel = 0)
		{
		Gosub, ClickOnFoundImage
		Sleep 1000
		Gosub, ClickOnFoundImage
		Sleep 1000
		}
	ImageSearch, FoundX, FoundY, 0, 0, A_ScreenWidth, A_ScreenHeight, *80 %A_ScriptDir%\images\%Priority6%.png
	If (ErrorLevel = 0)
		{
		Gosub, ClickOnFoundImage
		Sleep 1000
		Gosub, ClickOnFoundImage
		Sleep 1000
		}
	ImageSearch, FoundX, FoundY, 0, 0, A_ScreenWidth, A_ScreenHeight, *80 %A_ScriptDir%\images\%Priority7%.png
	If (ErrorLevel = 0)
		{
		Gosub, ClickOnFoundImage
		Sleep 1000
		Gosub, ClickOnFoundImage
		Sleep 1000
		}
	ImageSearch, FoundX, FoundY, 0, 0, A_ScreenWidth, A_ScreenHeight, *80 %A_ScriptDir%\images\%Priority8%.png
	If (ErrorLevel = 0)
		{
		Gosub, ClickOnFoundImage
		Sleep 1000
		Gosub, ClickOnFoundImage
		Sleep 1000
		}
	ImageSearch, FoundX, FoundY, 0, 0, A_ScreenWidth, A_ScreenHeight, *80 %A_ScriptDir%\images\%Priority9%.png
	If (ErrorLevel = 0)
		{
		Gosub, ClickOnFoundImage
		Sleep 1000
		Gosub, ClickOnFoundImage
		Sleep 1000
		}
	ImageSearch, FoundX, FoundY, 0, 0, A_ScreenWidth, A_ScreenHeight, *80 %A_ScriptDir%\images\%Priority0%.png
	If (ErrorLevel = 0)
		{
		Gosub, ClickOnFoundImage
		Sleep 1000
		Gosub, ClickOnFoundImage
		Sleep 1000
		}
	ImageSearch, FoundX, FoundY, 0, 0, A_ScreenWidth, A_ScreenHeight, *80 %A_ScriptDir%\images\%Priority10%.png
	If (ErrorLevel = 0)
		{
		Gosub, ClickOnFoundImage
		Sleep 1000
		Gosub, ClickOnFoundImage
		Sleep 1000
		}
Return
