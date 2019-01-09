goto comment

custom_win_update.bat

Copyright 2018 Matthew S. Kesselring

   Licensed under the Apache License, Version 2.0 (the "License");
   you may not use this file except in compliance with the License.
   You may obtain a copy of the License at

       http://www.apache.org/licenses/LICENSE-2.0

   Unless required by applicable law or agreed to in writing, software
   distributed under the License is distributed on an "AS IS" BASIS,
   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
   See the License for the specific language governing permissions and
   limitations under the License.

:comment
@ECHO OFF & CLS & ECHO.

NET FILE 1>NUL 2>NUL & IF ERRORLEVEL 1 (ECHO You must right-click and select & ECHO "RUN AS ADMINISTRATOR"  to run this batch. Exiting... & ECHO. & PAUSE & EXIT /D)
REM ... proceed here with admin rights ...

sc config "wuauserv" start= disabled
sc stop "wuauserv"

SET path=%~dp0
copy "%path%win_update.bat" "C:\Program Files\win_update.bat"

c:\windows\system32\schtasks.exe /create /tn Windows_Update /xml "%path%Windows_Update.xml"
c:\windows\system32\schtasks.exe /change /tn "\Microsoft\Windows\WindowsUpdate\Scheduled Start" /disable
c:\windows\system32\schtasks.exe /change /tn "\Microsoft\Windows\WindowsUpdate\Scheduled Start With Network" /disable

pause
