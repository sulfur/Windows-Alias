@echo off
cls
set "ESC="
set "PURPLE=%ESC%[35m"
set "WHITE=%ESC%[37m"
set "GRAY=%ESC%[90m"
set "BORDEAUX=%ESC%[91m"
set "AQUA=%ESC%[36m"
set "RESET=%ESC%[0m"
for /f "delims=: tokens=*" %%A in ('findstr /b ::: "%~f0"') do echo %PURPLE%%%A%RESET%

:::   _____  .__  .__                           ___ ___         .__          
:::  /  _  \ |  | |__|____    ______           /   |   \   ____ |  | ______  
::: /  /_\  \|  | |  \__  \  /  ___/  ______  /    ~    \_/ __ \|  | \____ \ 
::: /    |    \  |_|  |/ __ \_\___ \  /_____/  \    Y    /\  ___/|  |_|  |_> >
::: \____|__  /____/__(____  /____  >           \___|_  /  \___  >____/   __/ 
:::         \/             \/     \/                  \/       \/     |__|     
:::                                 @by sulf

:: Alias list
echo %GRAY%Alias Available:%RESET%
echo [35malias-add = [36mAdds a new custom alias.[0m
echo [35malias-help = [36mList of all created aliases.[0m
echo [35mping - [36mecho pong.[0m
 
echo [35mitsme = [36mecho mario[0m  
 
