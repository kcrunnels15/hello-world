@ECHO OFF
@COLOR a0
TITLE Internet God
@setlocal EnableDelayedExpansion
@goto MenuList

:MenuList
cls

Set "INPUT="
Set "i=0"

Echo Well, well, well. Which of these WiFI networks would you like to connect to?
Echo(

Rem | Grab all networks
For /F "Tokens=*" %%A In ('netsh wlan show networks') Do (

    Rem | Grab key for each profile
    for /f "tokens=3,*" %%C in ('Echo %%A^| find /I "SSID"') do (

        Rem | Remove Empty Lines
        For /F "Tokens=*" %%E In ("%%D") Do (

            Rem | Set Strings
            Set /A "i+=1"

            Rem | Save Variable As String
            Set "Num!i!=%%E"

            Rem | Print String To Console
            Echo   !i! - %%E

        )
    )
)
Echo   0 - Disconnect

Echo(
Set /P INPUT=Set Your Choice And Press Enter: 
IF /I "!INPUT!"=="0" netsh wlan disconnect && Call sysstemgod.cmd && EXIT

Rem | Check For Valid Listing
IF /I "!Num%INPUT%!"=="" (

    Rem | Number Not Listed!
    Echo(
    Echo ERROR: Number Was Not On The List.

    Pause>NUL
    goto MenuList

)

Cls

Rem | Set WiFi Name
Set "WiFiName=!Num%INPUT%!"

Rem | Ask For Encryption | Ask For Password
Set /p "IsProtected=Is This Network Password Protected [yes/no]: "

If "!IsProtected!"=="yes" (

    Set /p "RawPassword=What's The Password For !WiFiName!: "
    Call :stringToHex "!RawPassword!" "HexDataPassword"

) Else (

    Call :stringToHex "None" "HexDataPassword"

)

Rem | Convert Stuff To Hex
Call :stringToHex "!WiFiName!" "HexDataName"

Rem | Export Data

If exist "ExportWiFi.xml" (Del ExportWiFi.xml)
(
    Echo ^<?xml version="1.0"?^>
    Echo ^<WLANProfile xmlns="http://www.microsoft.com/networking/WLAN/profile/v1"^>
    Echo    ^<name^>!WiFiName!^</name^>
    Echo    ^<SSIDConfig^>
    Echo        ^<SSID^>
    Echo            ^<hex^>!HexDataName!^</hex^>
    Echo            ^<name^>!WiFiName!^</name^>
    Echo        ^</SSID^>
    Echo    ^</SSIDConfig^>
    Echo    ^<connectionType^>ESS^</connectionType^>
    Echo    ^<connectionMode^>auto^</connectionMode^>
    Echo    ^<MSM^>
    Echo        ^<security^>
    Echo            ^<authEncryption^>
    Echo                ^<authentication^>WPA2PSK^</authentication^>
    Echo                ^<encryption^>AES^</encryption^>
    Echo                ^<useOneX^>false^</useOneX^>
    Echo            ^</authEncryption^>
    Echo            ^<sharedKey^>
    Echo                ^<keyType^>passPhrase^</keyType^>
    Echo                ^<protected^>false^</protected^>
    Echo                ^<keyMaterial^>!HexDataPassword!^</keyMaterial^>
    Echo            ^</sharedKey^>
    Echo        ^</security^>
    Echo    ^</MSM^>
    Echo ^</WLANProfile^>
)>> ExportWiFi.xml

pause

Rem | Add Profile
netsh wlan add profile filename="ExportWiFi.xml"

Rem | Connect To Profile
netsh wlan connect name="!WiFiName!"

Rem | Remove Profile
netsh wlan delete profile name="!WiFiName!"

pause

Rem | Process Complete
Del ExportWiFi.xml
goto MenuList

:stringToHex
Rem | String To Hex By: Aacini
Rem | Store the string in chr.tmp file
set /P "=%~1" < NUL > chr.tmp

Rem | Create zero.tmp file with the same number of Ascii zero characters
for %%a in (chr.tmp) do fsutil file createnew zero.tmp %%~Za > NUL

Rem | Compare both files with FC /B and get the differences
set "hex="
for /F "skip=1 tokens=2" %%a in ('fc /B chr.tmp zero.tmp') do set "hex=!hex!%%a"

del chr.tmp zero.tmp
set "%~2=%hex%"

GOTO browser

:browser
CLS
ECHO If you are connecting to the internet, which browser would you like to use?
ECHO 1 Firefox
ECHO 2 Chrome
ECHO 3 Exit, because I already have a browser open
Choice /n /c 123

IF %errorlevel%==1 GOTO firefox
IF %errorlevel%==2 GOTO chrome
IF %errorlevel%==3 CALL systemgod.cmd && EXIT

:firefox
CLS
ECHO Is there a particular URL you wish to visit?
SET /P url="URL>"
START firefox.exe %url%
Call systemgod.cmd
EXIT

:chrome
CLS
ECHO Is there a particular URL you wish to visit?
SET /P url="URL>"
START chrome.exe %url%
Call systemgod.cmd
EXIT
