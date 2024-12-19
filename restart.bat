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

start cmd /k "cd /d %current_path% && echo %GREEN% Restart succeded! - %PURPLE% Alias by %AQUA%@sulf" %RESET%

exit