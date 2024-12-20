@echo off
setlocal enabledelayedexpansion

if "%~1"=="" (
    echo Usage: alias-remove ^<command_name^>
    echo Example: alias-remove ping
    goto :eof
)

set "line_to_remove=ECHO disattivato."
set "command_to_delete=%~1"
set "protected_aliases=restart alias-new alias-help alias-remove"

for %%P in (%protected_aliases%) do (
    if /i "%command_to_delete%"=="%%P" (
        echo Error: "%command_to_delete%" is a protected alias and cannot be removed.
        goto :eof
    )
)

set "temp_file=%~dp0alias_temp.bat"

(for /f "usebackq delims=" %%A in ("%~dp0alias.bat") do (
    echo %%A | findstr /i /c:"doskey %command_to_delete%=" >nul
    if errorlevel 1 (
        echo %%A | findstr /i /c:"%line_to_remove%" >nul
        if errorlevel 1 (
            echo %%A
        )
    )
)) > "%temp_file%"

move /y "%temp_file%" "%~dp0alias.bat" >nul

echo Command "%command_to_delete%" and the line "%line_to_remove%" removed from alias.bat.
call "%~dp0fix.bat"
call "%~dp0restart.bat" "Alias removed: %command_to_delete%"
