@echo off
if exist plutonium-updater.exe (goto start) else (goto download)
:download
echo Downloading Updater...
echo.
powershell -Command "Start-BitsTransfer "https://github.com/mxve/plutonium-updater.rs/releases/latest/download/plutonium-updater-x86_64-pc-windows-msvc.zip"
tar -xf plutonium-updater-x86_64-pc-windows-msvc.zip
del plutonium-updater-x86_64-pc-windows-msvc.zip
echo Done!
goto start
:start
if exist "bin\plutonium-launcher-win32.exe" (echo Updating Plutonium Portable...) else (echo Downloading Plutonium Files...)
echo.
plutonium-updater.exe -l -d "%~dp0"
start "" "bin\plutonium-launcher-win32.exe" >nul
echo.
echo Update finished! Exiting...
timeout /t 3 >nul
exit