@echo off
:: add.bat - Script to add aliases with description in alias.bat

set "alias_file=alias.bat"

:: Enable delayed variable expansion
setlocal enabledelayedexpansion

:: Define escape sequences for colors
set "ESC="
set "PURPLE=%ESC%[35m"
set "WHITE=%ESC%[37m"
set "GRAY=%ESC%[90m"
set "BORDEAUX=%ESC%[91m"
set "AQUA=%ESC%[36m"
set "RESET=%ESC%[0m"

:START
cls
for /f "delims=: tokens=*" %%A in ('findstr /b ::: "%~f0"') do echo %PURPLE%%%A%RESET%

:: Ask for the alias name
:ASK_ALIAS
echo %GRAY%Enter the alias name (or type "exit" to quit): %RESET%
set /p alias_name=
if /i "%alias_name%"=="exit" exit /b
if "%alias_name%"=="" (
    echo %BORDEAUX%Error: The alias name cannot be empty. Please try again.%RESET%
    goto ASK_ALIAS
)

:: Check if the alias already exists
findstr /i "^%alias_name%=" %alias_file% >nul 2>&1
if not errorlevel 1 (
    echo %BORDEAUX%Error: The alias "%alias_name%" already exists. Choose another one.%RESET%
    goto ASK_ALIAS
)

:: Ask for the type of command
:CHOOSE_TYPE
echo %WHITE%Select the type of command:
echo 1. Simple command
echo 2. Installed program (enter path manually)%RESET%
set /p choice=Enter your choice [1-2]: 
if "%choice%"=="1" goto SIMPLE_COMMAND
if "%choice%"=="2" goto PROGRAM_COMMAND
echo %BORDEAUX%Error: Invalid choice. Please try again.%RESET%
goto CHOOSE_TYPE

:SIMPLE_COMMAND
echo %WHITE%Enter the command to execute: %RESET%
set /p alias_command=
if "%alias_command%"=="" (
    echo %BORDEAUX%Error: The command cannot be empty. Please try again.%RESET%
    goto SIMPLE_COMMAND
)
set "alias_description=Executes the command '%alias_command%'"
goto SAVE_ALIAS

:PROGRAM_COMMAND
:: Ask the user to enter the executable path
echo %WHITE%Enter the absolute path of the executable: %RESET%
set /p exe_path=
if "%exe_path%"=="" (
    echo %BORDEAUX%Error: The path cannot be empty. Please try again.%RESET%
    goto PROGRAM_COMMAND
)

:: Verify if the executable path is valid
if not exist "%exe_path%" (
    echo %BORDEAUX%Error: The executable file does not exist. Please try again.%RESET%
    goto PROGRAM_COMMAND
)

set "alias_command=call \"%exe_path%\""
set "alias_description=Starts the program '%exe_path%'"

:SAVE_ALIAS
:: Add the alias to the alias.bat file
echo doskey %alias_name%=%alias_command% >> "C:\Users\Francesco\Desktop\alias\alias.bat" & echo. >> "C:\Users\Francesco\Desktop\alias\alias.bat"
echo echo %PURPLE%%alias_name% = %AQUA%%alias_command%%RESET% >> "C:\Users\Francesco\Desktop\alias\help.bat" & echo. >> "C:\Users\Francesco\Desktop\alias\help.bat"

:: Update the current session with the new alias
doskey %alias_name%=%alias_command%

echo %AQUA%Alias "%alias_name%" added successfully!%RESET%

:: Ask if the user wants to add another alias
echo.
echo %GRAY%Do you want to add another alias? (y/n): %RESET%
set /p another=
if /i "%another%"=="y" goto START
exit /b
:::       .__  .__                                                 
:::  _____  |  | |__|____    ______             ____   ______  _  __
:::  \__  \ |  | |  \__  \  /  ___/   ______   /    \_/ __ \ \/ \/ /
:::   / __ \|  |_|  |/ __ \_\___ \   /_____/  |   |  \  ___/\     / 
:::  (____  /____/__(____  /____  >           |___|  /\___  >\/\_/  
:::       \/             \/     \/                 \/     \/        
:::                             @by sulf
