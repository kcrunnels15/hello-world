@echo off
TItle Folder God
Color a0

:start
CLS
ECHO Well, well, well, well, well, well.
ECHO Would you like to:
ECHO 1.) Delete a folder
ECHO 2.) Create a folder
ECHO 3.) Toggle folder visability
ECHO 4.) I don't know where it is.
CHOICE /n /c 1234

If %errorlevel%==1 goto delete
if %errorlevel%==2 goto create
if %errorlevel%==3 goto toggle
If %errorlevel%==4 goto tree

:delete
CLS
ECHO Where is the folder you would like to delete?
SET /P folder=Enter the folder where the folder is located. Preset to %USERPROFILE%, so enter Desktop to delete a folder in Desktop:  
SET /P name=Name of folder to be deleted: 
CHDIR %USERPROFILE%\%folder%
RMDIR %name%
Call systemgod.cmd
EXIT

:toggle
CLS
ECHO Where is the folder you would like to toggle the visibilty of?
SET /P folder=Enter the folder where the folder is located. Preset to %USERPROFILE%, so enter Desktop to toggle a folder in Desktop:  
SET /P name=Name of folder to be toggled: 
CHDIR %USERPROFILE%\%folder%
ECHO 1.) Hide folder
ECHO 2.) Show folder
CHOICE /N /C 12

IF %errorlevel%==1  ATTRIB +H %name% /S /D
IF %errorlevel%==2 ATTRIB -H %name% /S /D
Call systemgod.cmd
EXIT

:create
CLS
ECHO Where would you like to create a folder?
SET /P folder=Enter the folder where you would like to create one. Preset to %USERPROFILE%, so enter Desktop to create a folder in Desktop:  
SET /P name=Name of new folder: 
CHDIR %USERPROFILE%\%folder%
MKDIR %name%
Call systemgod.cmd
EXIT

:tree
ECHO Which major directory would you like to look in first?
ECHO 1.) Desktop
ECHO 2.) %USERPROFILE%

CHOICE /n /c 12
IF %errorlevel%==1 CHDIR %USERPROFILE%\Desktop
If %errorlevel%==2 CHDIR %USERPROFILE%

TREE
PAUSE
GOTO start