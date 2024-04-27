@echo off
title Plutonium Portable Launcher
:checkdownloader
if exist plutonium-updater.exe (goto start2) else (if exist plutonium.exe (goto start) else (goto downloaderchoice))
:downloaderchoice
cls
echo.
echo Which downloader would you like to use in the future?
echo (this will only show up the first time when no downloader is found)
echo.
echo 1 = Official Plutonium Installer
echo 2 = mxve's plutonium-updater.js
echo.
echo if unsure just select the official one.
echo.
set /p c=Select your Option: 
if "%c%"=="1" goto download
if "%c%"=="2" goto download2
if "%c%" GTR "2" goto downloaderchoice
if "%c%" LSS "1" goto downloaderchoice
:download
cls
echo.
echo Downloading Updater...
echo.
powershell -Command "Start-BitsTransfer "https://cdn.plutonium.pw/updater/plutonium.exe"
echo Done!
goto start
:download2
cls
echo.
echo Downloading Updater...
echo.
powershell -Command "Start-BitsTransfer "https://github.com/mxve/plutonium-updater.rs/releases/latest/download/plutonium-updater-x86_64-pc-windows-msvc.zip"
tar -xf plutonium-updater-x86_64-pc-windows-msvc.zip
del plutonium-updater-x86_64-pc-windows-msvc.zip
echo Done!
goto start2
:start
cls
echo.
if exist "plutonium\bin\plutonium-launcher-win32.exe" (echo Updating Plutonium Files...) else (echo Downloading Plutonium Files...)
plutonium.exe -install-dir "plutonium"
echo.
echo Update finished! Exiting...
timeout /t 3 >nul
exit
:start2
cls
echo.
if exist "plutonium\bin\plutonium-launcher-win32.exe" (echo Updating Plutonium Files...) else (echo Downloading Plutonium Files...)
echo.
plutonium-updater.exe -l -d "%~dp0\plutonium"
start "" "plutonium\bin\plutonium-launcher-win32.exe" >nul
echo.
echo Update finished! Exiting...
timeout /t 3 >nul
exit
