@echo off

set "current_path=%cd%"
set "ESC="
set "PURPLE=%ESC%[35m"
set "WHITE=%ESC%[37m"
set "GRAY=%ESC%[90m"
set "BORDEAUX=%ESC%[91m"
set "AQUA=%ESC%[36m"
set "RESET=%ESC%[0m"
set "GREEN=%ESC%[32m"

if "%~1"=="" (
    set "message=%GRAY% Restart succeeded! - %PURPLE% Alias by %AQUA%@sulf"
) else (
    set "message=%GRAY%%~1 - %PURPLE% Alias by %AQUA%@sulf"
)

start cmd /k "cd /d %current_path% && echo %message% %RESET%"
call "%~dp0fix.bat"
exit
