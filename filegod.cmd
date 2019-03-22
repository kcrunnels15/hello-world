@echo off
TITLE File God
COLOR a0

:start
CLS
ECHO Well, well, well, well, well, well.
ECHO Would you like to:
ECHO 1.) Delete a file
ECHO 2.) Create a file
ECHO 3.) Open a file
ECHO 4.) I don't know where it is.
CHOICE /n /c 1234

If %errorlevel%==1 goto delete
if %errorlevel%==2 goto create
if %errorlevel%==3 goto open
if %errorlevel%==4 goto tree

:delete
CLS
ECHO Where is the file you would like to delete?
SET /P folder=Enter the folder where you wish to delete the file. Preset to %USERPROFILE%, so enter Desktop to delete a file in Desktop: 
SET /P name=Name of file,without extention: 
SET /P ext=Extension, without dot: 
CHDIR %USERPROFILE%\%folder%
DEL %name%.%ext%
Call systemgod.cmd
EXIT

:create
CLS

ECHO Where is the file you would like to create?
SET /P folder=Enter the folder where you wish to create the file. Preset to %USERPROFILE%, so enter Desktop to create a file in Desktop: 
SET /P filetype="filetype=>"
CHDIR %USERPROFILE%\%folder%
ECHO.>newfile.%filetype%
IF ( %filetype%==docx START WINWord newfile.%filetype%
    ) IF ( %filetype%==pptx START powerpnt newfile.%filetype%	
	) ELSE ( START notepad.exe newfile.%filetype% )
Call systemgod.cmd
EXIT

:open
CLS
ECHO Where is the file you would like to open?
SET /P folder=Enter the folder where you wish to open the file. Preset to %USERPROFILE%, so enter Desktop to open a file in Desktop: 
SET /P name=Name of file:  
SET /P ext=Extension, without dot: 
CHDIR %USERPROFILE%\%folder%
START %name%.%ext%
Call systemgod.cmd
EXIT

:tree
ECHO Which major directory would you like to look in first?
ECHO 1.) Desktop
ECHO 2.) %USERPROFILE%
CHOICE /n /c 12
IF %errorlevel%==1 CHDIR %USERPROFILE%\Desktop
If %errorlevel%==2 CHDIR %USERPROFILE%
TREE /F
PAUSE
GOTO start
