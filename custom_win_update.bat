@ECHO OFF & CLS & ECHO.

NET FILE 1>NUL 2>NUL & IF ERRORLEVEL 1 (ECHO You must right-click and select & ECHO "RUN AS ADMINISTRATOR"  to run this batch. Exiting... & ECHO. & PAUSE & EXIT /D)
REM ... proceed here with admin rights ...

sc config "wuauserv" start= disabled
sc stop "wuauserv"

SET path=%~dp0
copy "%path%win_update.bat" "C:\Program Files\win_update.bat"

REM schtasks /create /tn Windows_Update /RL HIGHEST /tr "C:\Program Files\win_update.bat" /sc MONTHLY /st 12:00:00
c:\windows\system32\schtasks.exe /create /tn Windows_Update /xml "%path%Windows_Update.xml"


pause
