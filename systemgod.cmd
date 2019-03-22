@echo off
Title System God
COLOR a0
GOTO Control

:Control
CLS
ECHO Well, hello, hello, hello, good %TIME%.
ECHO What do you wish to do in this session of System God?
ECHO.
ECHO 1.) File and Folder Manager
ECHO 2.) Internet
ECHO 3.) Execute CMD Commands
ECHO 4.) Run programs
ECHO 5.) Tasklist and Taskkill
ECHO 6.) Exit
ECHO.
CHOICE /N /C 123456

IF %errorlevel%==1 GOTO file
IF %errorlevel%==2 GOTO internet
IF %errorlevel%==3 GOTO cmd
IF %errorlevel%==4 goto programs
IF %errorlevel%==5 GOTO tnt
IF %errorlevel%==6 EXIT

:file
CLS
ECHO Well, well, well. What do you need to do?
ECHO.
ECHO 1.) Sort files
ECHO 2.) Control files
ECHO 3.) Control folders
ECHO.
CHOICE /N /C 123

IF %errorlevel%==1 CALL sortgod.cmd
IF %errorlevel%==2 CALL filegod.cmd
IF %errorlevel%==3 CALL foldergod.cmd
EXIT

:internet
CLS
CALL internetgod.cmd
EXIT

:cmd
CLS
CD "C:\Windows\System32"
START cmd.exe
GOTO Control

:programs
CLS
ECHO 1.) Notepad
ECHO 2.) Microsoft Word
ECHO 3.) Adobe Acrobat
ECHO 4.) Control Panel
ECHO 5.) Powerpoint
ECHO 6.) Firefox
ECHO 7.) Chrome
ECHO 8.) Exit
CHOICE /N /C 12345678
 
If %errorlevel%==1 START notepad.exe
If %errorlevel%==2 START WINWord
If %errorlevel%==3 START AcroRD32.exe
If %errorlevel%==4 START Control Panel
If %errorlevel%==5 START powerpnt
If %errorlevel%==6 START firefox.exe
If %errorlevel%==7 START chrome.exe
If %errorlevel%==8 GOTO Control
GOTo Control
EXIT

:tnt
CLS
ECHO Do you want view running applications, or shut them off?
ECHO 1.) View
echo 2.) Kill
CHOICE /n /c 12
IF %errorlevel%==1 GOTO tasklist 
IF %errorlevel%==2 GOTo taskkill

:tasklist
CLS
Tasklist
PAUSE
GOTO Control

:taskkill
CLS
ECHO 1.) Firefox
ECHo 2.) Control Panel
ECHo 3.) Word
ECHO 4.) Adobe Acrobat
ECHO 5.) PowerPoint
ECHO 6.) Chrome
ECHO 7.) Notepad
ECHO 8.) Exit
CHOICE /n /c 12345678
if %errorlevel%==1 TASKKILL /IM firefox.exe
if %errorlevel%==2 TASKKILL /IM gvim.exe
if %errorlevel%==3 TASKKILL /IM Notepad++.exe
if %errorlevel%==4 TASKKILL /IM WINWord
if %errorlevel%==5 TASKKILL /IM AcroRD32.exe
if %errorlevel%==6 TASKKILL /IM powerpnt
if %errorlevel%==7 TASKKILL /IM chrome.exe
if %errorlevel%==8 TASKKILL /IM notepad.exe
if %errorlevel%==9 GOTO Control
