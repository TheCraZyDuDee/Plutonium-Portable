@echo off
title Plutonium Lan Launcher
cd plutonium
setlocal enabledelayedexpansion

::set plutonium-bootstrapper as variable
set bootstrapper=bin\plutonium-bootstrapper-win32.exe
if not exist offline.txt goto as2

::set variables for username and paths from file
:as1
set "filename=offline.txt"
set /a "counter=0"
for /f "tokens=*" %%a in (%filename%) do (
set /a counter+=1
set "option!counter!=%%a")
goto start

:: let user provide username and paths
:as2
echo.
echo No offline.txt found, please provide username and game paths.
echo If you need to change something in the future please delete or edit the offline.txt which is in the same folder.
echo.
set /p option1= Enter Username: 
set /p option2= Enter Path to World at War: 
set /p option3= Enter Path to Black Ops: 
set /P option4= Enter Path to Black Ops II: 
set /p option5= Enter Path to Modern Warfare 3: 
(echo=!option1!)>>offline.txt
(echo=!option2!)>>offline.txt
(echo=!option3!)>>offline.txt
(echo=!option4!)>>offline.txt
(echo=!option5!)>>offline.txt

:start
cls
echo.
echo   ////////////////////////////
echo  // Plutonium Lan Launcher //
echo ////////////////////////////
echo.
echo Play Plutonium offline or in Lan with your friends.
echo.
echo Welcome !option1!.
echo Choose one of the Games to start:
echo.
echo 0 - World at War (Zombies)
echo 1 - World at War (Multiplayer)
echo 2 - Black Ops (Zombies)
echo 3 - Black Ops (Multiplayer)
echo 4 - Black Ops II (Zombies)
echo 5 - Black Ops II (Multiplayer)
echo 6 - Modern Warfare 3 (Multiplayer)
echo.
set /p c=Select your Option: 
if "!c!" GTR "6" goto start

cls
echo.
echo Launching Game...
if "!c!"=="0" "!bootstrapper!" t4sp "!option2!" -nocurses -lan -offline -name "!option1!"
if "!c!"=="1" "!bootstrapper!" t4mp "!option2!" -nocurses -lan -offline -name "!option1!"
if "!c!"=="2" "!bootstrapper!" t5sp "!option3!" -nocurses -lan -offline -name "!option1!"
if "!c!"=="3" "!bootstrapper!" t5mp "!option3!" -nocurses -lan -offline -name "!option1!"
if "!c!"=="4" "!bootstrapper!" t6zm "!option4!" -nocurses -lan -offline -name "!option1!"
if "!c!"=="5" "!bootstrapper!" t6mp "!option4!" -nocurses -lan -offline -name "!option1!"
if "!c!"=="6" "!bootstrapper!" iw5mp "!option5!" -nocurses -lan -offline -name "!option1!"
endlocal
echo Game closed! Exiting...
timeout /t 3 >nul
exit
