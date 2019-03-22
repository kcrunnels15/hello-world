@echo off
title Sort God
COLOR a0
goto top

:reset
if "%1"=="" (cls & echo You cannot goto :reset, use 'call :reset *random letter*' & pause)
set compressedToggle= 
set videoToggle= 
set audioToggle= 
set imageToggle= 
set documentsToggle= 
set exeToggle= 
set tdToggle= 
goto :eof

:top

call :reset f
cls
echo.
echo Welcome to File Sorter. 
echo.
SET /P sortfolder=Please enter the path of of the folder you wish to be sorted. Default path is %userprofile%, so enter Desktop to sort items in Desktop: 
echo 1.) Sort
echo 2.) Exit
choice /n /c 12
if %errorlevel%==1 goto types
if %errorlevel%==2 (
CALL systemgod.cmd
EXIT
)

:types



cls
echo.
echo Please select the filetypes you wish to be sorted.
echo.
echo 1.) [%compressedToggle%] Compressed Files (rar, 7z, zip)
echo 2.) [%videoToggle%] Video Files (3gp, f4v, flv, h264, mov, mp4, mpeg, mpg, webm)
echo 3.) [%audioToggle%] Audio Files (mp3, wav, m4a, ogg, wma)
echo 4.) [%imageToggle%] Image Files (bmp, ico, jpeg, jpg, png, tga, tif, tiff)
echo 5.) [%documentsToggle%] Document Files (doc, docm, docx, pdf, rtf, xls, xml, txt)
echo 6.) [%exeToggle%] Exe Files (exe, msi, bat)
echo 7.) [%tdToggle%] 3D Files (c4d, blend, 3ds, max, obj, fbx)
echo.
echo 8.) Go
choice /n /c 12345678
if %errorlevel%==1 (if "%compressedToggle%"=="X" (set compressedToggle= ) else (set compressedToggle=X))
if %errorlevel%==2 (if "%videoToggle%"=="X" (set videoToggle= ) else (set videoToggle=X))
if %errorlevel%==3 (if "%audioToggle%"=="X" (set audioToggle= ) else (set audioToggle=X))
if %errorlevel%==4 (if "%imageToggle%"=="X" (set imageToggle= ) else (set imageToggle=X))
if %errorlevel%==5 (if "%documentsToggle%"=="X" (set documentsToggle= ) else (set documentsToggle=X))
if %errorlevel%==6 (if "%exeToggle%"=="X" (set exeToggle= ) else (set exeToggle=X))
if %errorlevel%==7 (if "%tdToggle%"=="X" (set tdToggle= ) else (set tdToggle=X))

if %errorlevel%==8 goto runScan
goto types


:runScan
cls
if "%compressedToggle%"=="X" call :sortCompressed
if "%videoToggle%"=="X" call :sortVideo
if "%audioToggle%"=="X" call :sortAudio
if "%imageToggle%"=="X" call :sortImage
if "%documentsToggle%"=="X" call :sortDocuments
if "%exeToggle%"=="X" call :sortExe
if "%tdToggle%"=="X" call :sortTd

goto done

:sortCompressed
echo Sorting Compressed...
if not exist "C:\Users\%username%\%sortfolder%\Compressed Files" md "C:\Users\%username%\%sortfolder%\Compressed Files" >nul
for %%A in ("C:\Users\%username%\%sortfolder%\*.rar") do move "%%A" "C:\Users\%username%\%sortfolder%\Compressed Files\" >nul
for %%A in ("C:\Users\%username%\%sortfolder%\*.7z") do move "%%A" "C:\Users\%username%\%sortfolder%\Compressed Files\" >nul
for %%A in ("C:\Users\%username%\%sortfolder%\*.zip") do move "%%A" "C:\Users\%username%\%sortfolder%\Compressed Files\" >nul
goto :eof

:sortVideo
REM 3gp, f4v, flv, h264, mov, mp4, mpeg, mpg, webm

echo Sorting Videos...
if not exist "C:\Users\%username%\%sortfolder%\Video Files" md "C:\Users\%username%\%sortfolder%\Video Files" >nul
for %%A in ("C:\Users\%username%\%sortfolder%\*.3gp") do move "%%A" "C:\Users\%username%\%sortfolder%\Video Files\" >nul
for %%A in ("C:\Users\%username%\%sortfolder%\*.f4v") do move "%%A" "C:\Users\%username%\%sortfolder%\Video Files\" >nul
for %%A in ("C:\Users\%username%\%sortfolder%\*.flv") do move "%%A" "C:\Users\%username%\%sortfolder%\Video Files\" >nul
for %%A in ("C:\Users\%username%\%sortfolder%\*.h264") do move "%%A" "C:\Users\%username%\%sortfolder%\Video Files\" >nul
for %%A in ("C:\Users\%username%\%sortfolder%\*.mov") do move "%%A" "C:\Users\%username%\%sortfolder%\Video Files\" >nul
for %%A in ("C:\Users\%username%\%sortfolder%\*.mp4") do move "%%A" "C:\Users\%username%\%sortfolder%\Video Files\" >nul
for %%A in ("C:\Users\%username%\%sortfolder%\*.mpeg") do move "%%A" "C:\Users\%username%\%sortfolder%\Video Files\" >nul
for %%A in ("C:\Users\%username%\%sortfolder%\*.mpg") do move "%%A" "C:\Users\%username%\%sortfolder%\Video Files\" >nul
for %%A in ("C:\Users\%username%\%sortfolder%\*.webm") do move "%%A" "C:\Users\%username%\%sortfolder%\Video Files\" >nul
goto :eof

:sortAudio
REM (mp3, wav, m4a, ogg, wma)

echo Sorting Audio...
if not exist "C:\Users\%username%\%sortfolder%\Audio Files\" md "C:\Users\%username%\%sortfolder%\Audio Files\" >nul
for %%A in ("C:\Users\%username%\%sortfolder%\*.mp3") do move "%%A" "C:\Users\%username%\%sortfolder%\Audio Files\" >nul
for %%A in ("C:\Users\%username%\%sortfolder%\*.wav") do move "%%A" "C:\Users\%username%\%sortfolder%\Audio Files\" >nul
for %%A in ("C:\Users\%username%\%sortfolder%\*.m4a") do move "%%A" "C:\Users\%username%\%sortfolder%\Audio Files\" >nul
for %%A in ("C:\Users\%username%\%sortfolder%\*.ogg") do move "%%A" "C:\Users\%username%\%sortfolder%\Audio Files\" >nul
for %%A in ("C:\Users\%username%\%sortfolder%\*.wma") do move "%%A" "C:\Users\%username%\%sortfolder%\Audio Files\" >nul
goto :eof

:sortImage
REM (bmp, ico, jpeg, jpg, png, tga, tif, tiff)

echo Sorting Images...
if not exist "C:\Users\%username%\%sortfolder%\Image Files\" md "C:\Users\%username%\%sortfolder%\Image Files\" >nul
for %%A in ("C:\Users\%username%\%sortfolder%\*.bmp") do move "%%A" "C:\Users\%username%\%sortfolder%\Image Files\" >nul
for %%A in ("C:\Users\%username%\%sortfolder%\*.ico") do move "%%A" "C:\Users\%username%\%sortfolder%\Image Files\" >nul
for %%A in ("C:\Users\%username%\%sortfolder%\*.jpeg") do move "%%A" "C:\Users\%username%\%sortfolder%\Image Files\" >nul
for %%A in ("C:\Users\%username%\%sortfolder%\*.jpg") do move "%%A" "C:\Users\%username%\%sortfolder%\Image Files\" >nul
for %%A in ("C:\Users\%username%\%sortfolder%\*.png") do move "%%A" "C:\Users\%username%\%sortfolder%\Image Files\" >nul
for %%A in ("C:\Users\%username%\%sortfolder%\*.tga") do move "%%A" "C:\Users\%username%\%sortfolder%\Image Files\" >nul
for %%A in ("C:\Users\%username%\%sortfolder%\*.tif") do move "%%A" "C:\Users\%username%\%sortfolder%\Image Files\" >nul
for %%A in ("C:\Users\%username%\%sortfolder%\*.tiff") do move "%%A" "C:\Users\%username%\%sortfolder%\Image Files\" >nul
goto :eof

:sortDocuments
REM doc, docm, docx, pdf, rtf, xls, xml, txt

echo Sorting Documents...
if not exist "C:\Users\%username%\%sortfolder%\Document Files\" md "C:\Users\%username%\%sortfolder%\Document Files\" >nul
for %%A in ("C:\Users\%username%\%sortfolder%\*.doc") do move "%%A" "C:\Users\%username%\%sortfolder%\Document Files\" >nul
for %%A in ("C:\Users\%username%\%sortfolder%\*.docx") do move "%%A" "C:\Users\%username%\%sortfolder%\Document Files\" >nul
for %%A in ("C:\Users\%username%\%sortfolder%\*.docm") do move "%%A" "C:\Users\%username%\%sortfolder%\Document Files\" >nul
for %%A in ("C:\Users\%username%\%sortfolder%\*.pdf") do move "%%A" "C:\Users\%username%\%sortfolder%\Document Files\" >nul
for %%A in ("C:\Users\%username%\%sortfolder%\*.rtf") do move "%%A" "C:\Users\%username%\%sortfolder%\Document Files\" >nul
for %%A in ("C:\Users\%username%\%sortfolder%\*.xls") do move "%%A" "C:\Users\%username%\%sortfolder%\Document Files\" >nul
for %%A in ("C:\Users\%username%\%sortfolder%\*.xml") do move "%%A" "C:\Users\%username%\%sortfolder%\Document Files\" >nul
for %%A in ("C:\Users\%username%\%sortfolder%\*.txt") do move "%%A" "C:\Users\%username%\%sortfolder%\Document Files\" >nul
goto :eof

:sortExe

echo Sorting Exe/Installers...
if not exist "C:\Users\%username%\%sortfolder%\Exe Files\" md "C:\Users\%username%\%sortfolder%\Exe Files\" >nul
for %%A in ("C:\Users\%username%\%sortfolder%\*.exe") do move "%%A" "C:\Users\%username%\%sortfolder%\Exe Files\" >nul
for %%A in ("C:\Users\%username%\%sortfolder%\*.msi") do move "%%A" "C:\Users\%username%\%sortfolder%\Exe Files\" >nul
for %%A in ("C:\Users\%username%\%sortfolder%\*.cmd") do move "%%A" "C:\Users\%username%\%sortfolder%\Exe Files\" >nul
for %%A in ("C:\Users\%username%\%sortfolder%\*.bat") do move "%%A" "C:\Users\%username%\%sortfolder%\Exe Files\" >nul
goto :eof

:sortTd
REM c4d, blend, 3ds, max, obj, fbx

echo Sorting 3D...
if not exist "C:\Users\%username%\%sortfolder%\3D Files\" md "C:\Users\%username%\%sortfolder%\3D Files\" >nul
for %%A in ("C:\Users\%username%\%sortfolder%\*.c4d") do move "%%A" "C:\Users\%username%\%sortfolder%\3D Files\" >nul
for %%A in ("C:\Users\%username%\%sortfolder%\*.blend") do move "%%A" "C:\Users\%username%\%sortfolder%\3D Files\" >nul
for %%A in ("C:\Users\%username%\%sortfolder%\*.3ds") do move "%%A" "C:\Users\%username%\%sortfolder%\3D Files\" >nul
for %%A in ("C:\Users\%username%\%sortfolder%\*.max") do move "%%A" "C:\Users\%username%\%sortfolder%\3D Files\" >nul
for %%A in ("C:\Users\%username%\%sortfolder%\*.obj") do move "%%A" "C:\Users\%username%\%sortfolder%\3D Files\" >nul
for %%A in ("C:\Users\%username%\%sortfolder%\*.fbx") do move "%%A" "C:\Users\%username%\%sortfolder%\3D Files\" >nul
goto :eof


:done
echo.
echo Done. All files should be sorted!
echo.
echo If it didn't work how you wanted, right click on whichever folder,
echo click properties, and Previous Versions. You might be able to restore
echo the moves from a previous version.
pause
CALL systemgod.cmd
Exit