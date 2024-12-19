@ECHO Off
SETLOCAL

:: Prompt for user input
set /p input_string=Enter a string: 
echo.

:: Define the total width for centering (e.g., 50 characters)
SET "width=50"

:: Get the length of the input string
SET "string_length=0"
for /L %%A in (12,-1,0) do (
    SET /A "string_length|=1<<%%A"
    SET "tmp=%input_string:~0,%string_length%"
    if not "%tmp%"=="%input_string%" SET /A "string_length-=1"
)

:: Calculate the number of spaces to center the string
SET /A "spaces=($width - %string_length%) / 2"

:: Create the padded string
SET "centered_string="
for /L %%i in (1,1,%spaces%) do SET "centered_string=!centered_string! "

:: Concatenate the input string with the spaces
SET "centered_string=!centered_string!!input_string!"

:: Output the centered string
echo !centered_string!

GOTO :EOF
