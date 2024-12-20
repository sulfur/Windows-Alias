@echo off
setlocal EnableDelayedExpansion

set "alias_full_command="
echo Starting script...
:collect_args
if not "%~1"=="" (
    echo Collecting argument: %~1
    set "alias_full_command=!alias_full_command! %~1"
    shift
    goto collect_args
)
:: Execute the collected command
echo Command to execute: !alias_full_command!
call!alias_full_command!
if errorlevel 1 (
    echo Error executing command
    exit /b 1
)
endlocal