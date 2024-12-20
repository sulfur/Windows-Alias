@echo off
setlocal

set "BAT_PATH=%~dp0"

set "REG_KEY=HKCU\Software\Microsoft\Command Processor"
set "REG_VALUE=Autorun"
set "FILE_PATH=%BAT_PATH%alias.bat"
reg add "%REG_KEY%" /f >nul

reg add "%REG_KEY%" /v "%REG_VALUE%" /t REG_SZ /d "%FILE_PATH%" /f >nul

echo Registry key "%REG_KEY%" and value "%REG_VALUE%" added with the file path: "%FILE_PATH%"
pause

endlocal
