@echo off
:: add.bat - Script to add aliases with description in alias.bat

set "alias_file=alias.bat"
set "help_file=help.bat"

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
set "GREEN=%ESC%[32m"

if "%~1" == "" (
    goto START
)
if "%~2" == "" (
    echo Error: Missing command for alias "%~1".
    exit /b
)

set "alias_name=%~1"
shift /1  :: Sposta i parametri per rimuovere il primo (alias)

set "alias_command=%~2"


:: Ora raccogli tutti gli argomenti rimanenti
set "alias_full_command=%alias_command%"
:collect_args
if not "%~1" == "" (
    set "alias_command=%~1 !alias_full_command!"
    shift /1
)
goto :SAVE_ALIAS
exit /b


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

  :: Check if alias already exists in alias.bat
  findstr /i "^%alias_name%=" %alias_file% >nul 2>&1
  if not errorlevel 1 (
      echo %BORDEAUX%Error: The alias "%alias_name%" already exists. Choose another one.%RESET%
      goto ASK_ALIAS
  )

  :: Ask for the command type
  :CHOOSE_TYPE
  echo %WHITE%Select the type of command:
  echo 1. Simple command
  echo 2. Installed program (enter path manually)%RESET%
  set /p choice=Enter your choice [1-2]: 
  if "%choice%"=="1" goto SIMPLE_COMMAND
  if "%choice%"=="2" goto PROGRAM_COMMAND
  echo %BORDEAUX%Error: Invalid choice. Please try again.%RESET%
  goto CHOOSE_TYPE

  :: Simple Command - Ask for the command to execute
  :SIMPLE_COMMAND
  echo %WHITE%Enter the command to execute: %RESET%
  set /p alias_command=
  if "%alias_command%"=="" (
      echo %BORDEAUX%Error: The command cannot be empty. Please try again.%RESET%
      goto SIMPLE_COMMAND
  )
  set "alias_description=Executes the command '%alias_command%'"
  goto SAVE_ALIAS

  :: Program Command - Ask for the absolute path of the executable
  :PROGRAM_COMMAND
  echo %WHITE%Enter the absolute path of the executable: %RESET%
  set /p exe_path= 
  if "%exe_path%"=="" (
      echo %BORDEAUX%Error: The path cannot be empty. Please try again.%RESET%
      goto PROGRAM_COMMAND
  )

  :: Check if the executable exists
  if not exist "%exe_path%" (
      echo %BORDEAUX%Error: The executable file does not exist. Please try again.%RESET%
      goto PROGRAM_COMMAND
  )

  set "alias_command=call \"%exe_path%\""
  set "alias_description=Starts the program '%exe_path%'"

  :: Save the alias in alias.bat and description in help.bat
  :SAVE_ALIAS
  echo doskey %alias_name%=%alias_command% >> "%~dp0%alias_file%" & echo. >> "%~dp0%alias_file%"
  echo echo %PURPLE%%alias_name% = %AQUA%%alias_command%%RESET% >> "%~dp0%help_file%" & echo. >> "%~dp0%help_file%"

  :: Apply the alias immediately
  doskey %alias_name%=%alias_command%

  :: Provide success feedback to the user
  echo %PURPLE%Alias %AQUA% - %alias_name% -  %GRAY%added %GREEN%successfully!%RESET%

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
