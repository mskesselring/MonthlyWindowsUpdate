@echo off

:ASK
set /p answer=Run Windows Update (Y/N)?:
if /i "%answer:~,1%" EQU "Y" goto YES
if /i "%answer:~,1%" EQU "N" goto NO
goto ASK

:YES
echo Running Windows update
sc config "wuauserv" start= demand
sc start "wuauserv"
sc config "wuauserv" start= disabled
goto CONT
:NO
echo Cancelled Windows update

:CONT
