@echo off
call "%~dp0fix.bat"
::==============Protected==============
doskey restart=call "%~dp0restart.bat"
doskey alias-new=call "%~dp0add.bat" $*
doskey alias-help=call "%~dp0help.bat"
doskey alias-remove=call "%~dp0remove.bat" $*
::=====================================
