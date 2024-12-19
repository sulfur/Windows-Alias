@echo off
setlocal

:: Get the path of the directory where the batch file is located
set "BAT_PATH=%~dp0"

:: Define the registry key and value
set "REG_KEY=HKCU\Software\Microsoft\Command Processor"
set "REG_VALUE=Autorun"
set "FILE_PATH=%BAT_PATH%alias.bat"
:: Add the registry key if it doesn't exist
reg add "%REG_KEY%" /f >nul

:: Set the Autorun value to the path of the file
reg add "%REG_KEY%" /v "%REG_VALUE%" /t REG_SZ /d "%FILE_PATH%" /f >nul

echo Registry key "%REG_KEY%" and value "%REG_VALUE%" added with the file path: "%FILE_PATH%"
pause

endlocal
