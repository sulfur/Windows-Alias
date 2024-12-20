@echo off
setlocal enabledelayedexpansion

set "line_to_remove=ECHO disattivato."
set "temp_file=%~dp0alias_temp.bat"


(for /f "usebackq delims=" %%A in ("%~dp0alias.bat") do (
    echo %%A | findstr /i /c:"%line_to_remove%" >nul
    if errorlevel 1 (
        echo %%A
    )
)) > "%temp_file%"


move /y "%temp_file%" "%~dp0alias.bat" >nul


