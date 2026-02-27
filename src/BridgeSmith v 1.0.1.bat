REM Привілеї адміністратора

@echo off
:: Checking for administrator privileges...
net session >nul 2>&1
if %errorlevel% neq 0 (
    echo ===============================================
    echo   This script needs to be run by Administrator!
    echo ===============================================
    echo.
    echo I'm restarting with administrator privileges...
    echo.
    powershell -Command "Start-Process '%~f0' -Verb RunAs"
    exit
)

mode con cols=150 lines=50

REM Головне меню

title BridgeSmith v.1.0.1
color 0B

:menu
cls 
echo ====================================================
echo    BridgeSmith v.1.0.1 Main menu 
echo ====================================================
echo. 
echo Press key [1] = Utilities console
echo Press key [2] = DISM console
echo Press key [3] = Deep Cleaner console
echo Press key [4] = Shutdown console
echo Press key [5] = HDD \ SSD \ USB Servise
echo Press key [6] = Additional Windows settings
echo. 
echo ====================================================
echo Press [Alt+ENTER] = Full screen mode ON \ OFF
echo Press key [H] = HELP
echo Press key [X] = EXIT
echo ====================================================
set /p choice=Select an action and press ENTER = 
echo ====================================================

if /I "%choice%"=="1" goto Utilities_console 
if /I "%choice%"=="2" goto dismconsole
if /I "%choice%"=="3" goto Deep_Cleaner
if /I "%choice%"=="4" goto Shutdown_console
if /I "%choice%"=="5" goto HDD_SSD_USB
if /I "%choice%"=="6" goto Additional_Windows_settings

if /I "%choice%"=="H" goto Help
if /I "%choice%"=="X" goto end

echo Invalid choice, try again.
pause
goto menu 

REM Системні утиліти

:: ---------------- Utilities console ----------------
:Utilities_console
color 0A
cls
echo ====================================================
echo    Utilities console
echo ====================================================
echo Insert number [1] = System version
echo Insert number [2] = About PC
echo Insert number [3] = Mobility Center (For laptop only)
echo Insert number [4] = Notepad
echo Insert number [5] = Explorer (My computer folder)
echo Insert number [6] = Windows Turning components ON / OFF
echo Insert number [7] = Windows servises
echo Insert number [8] = Audio devices
echo Insert number [9] = Sound mixer
echo Insert number [10] = Device manager
echo Insert number [11] = System recovery (Control panel)
echo Insert number [12] = System configuration
echo Insert number [13] = Regedit (CAUTION! - CHANGING REGISTRY VALUES MAY DAMAGE YOUR SYSTEM OR MAKE IT UNSTABLE)
echo Insert number [14] = Task manager
echo Insert number [15] = Power control classic
echo Insert number [16] = Time and date classic
echo Insert number [17] = System properties
echo Insert number [18] = Programs and components
echo Insert number [19] = Control folders
echo Insert number [20] = Malicious Software Removal Tool
echo Insert number [21] = WinUtil (Internet connection required to run)
echo.
echo ====================================================
echo Press [Alt+ENTER] = Full screen mode ON \ OFF
echo Press key [H] = HELP
echo Press key [P] = Play sound (Sound existence test)
echo Press key [M] = Main menu
echo Press key [X] = EXIT
echo ====================================================
set /p choice=Select an action and press ENTER = 
echo ====================================================

if /I "%choice%"=="1" start winver.exe & goto Utilities_console
if /I "%choice%"=="2" start msinfo32.exe & goto Utilities_console
if /I "%choice%"=="3" start mblctr.exe & goto Utilities_console
if /I "%choice%"=="4" start notepad.exe & goto Utilities_console
if /I "%choice%"=="5" start explorer.exe & goto Utilities_console
if /I "%choice%"=="6" start OptionalFeatures.exe & goto Utilities_console
if /I "%choice%"=="7" start services.msc & goto Utilities_console
if /I "%choice%"=="8" start mmsys.cpl & goto Utilities_console
if /I "%choice%"=="9" start sndvol.exe & goto Utilities_console
if /I "%choice%"=="10" start devmgmt.msc & goto Utilities_console
if /I "%choice%"=="11" start rstrui.exe & goto Utilities_console
if /I "%choice%"=="12" start msconfig.exe & goto Utilities_console
if /I "%choice%"=="13" start Regedit.exe & goto Utilities_console
if /I "%choice%"=="14" start taskmgr.exe & goto Utilities_console
if /I "%choice%"=="15" start control powercfg.cpl & goto Utilities_console
if /I "%choice%"=="16" start timedate.cpl & goto Utilities_console
if /I "%choice%"=="17" start SystemPropertiesProtection.exe & goto Utilities_console
if /I "%choice%"=="18" start appwiz.cpl & goto Utilities_console
if /I "%choice%"=="19" start control folders & goto Utilities_console
if /I "%choice%"=="20" start MRT.exe & goto Utilities_console
if /I "%choice%"=="21" powershell -Command "irm christitus.com/win | iex"

if /I "%choice%"=="H" goto Help
if /I "%choice%"=="P" goto play_sound

if /I "%choice%"=="M" goto menu
if /I "%choice%"=="X" goto end
echo Invalid choice, try again.
pause
goto Utilities_console

REM Утиліта DISM

:: ---------------- DISM console ----------------
:dismconsole
color 0C
cls
echo ====================================================
echo    DISM CONSOLE
echo ====================================================
echo.
echo Press key [1] = Quick damage check
echo Press key [2] = Deep scan of system files
echo Press key [3] = Repairing damaged components
echo Press key [4] = Enable .NET Framework 3.5 (From mount ISO \ DVD \ USB device)
echo Press key [5] = Enable DirectPlay
echo Press key [6] = Driver backup
echo Press key [7] = Show latest updates
echo.
echo ====================================================
echo Press [Alt+ENTER] = Full screen mode ON \ OFF
echo Press key [H] = HELP
echo Press key [M] = Main menu
echo Press key [X] = EXIT
echo ====================================================
set /p choice=Select an action and press ENTER = 
echo ====================================================

if /I "%choice%"=="1" DISM /Online /Cleanup-Image /CheckHealth & powershell -c (New-Object Media.SoundPlayer "%SystemRoot%\Media\tada.wav").PlaySync(); & pause & goto dismconsole
if /I "%choice%"=="2" DISM /Online /Cleanup-Image /ScanHealth & powershell -c (New-Object Media.SoundPlayer "%SystemRoot%\Media\tada.wav").PlaySync(); & pause & goto dismconsole
if /I "%choice%"=="3" DISM /Online /Cleanup-Image /RestoreHealth & powershell -c (New-Object Media.SoundPlayer "%SystemRoot%\Media\tada.wav").PlaySync(); & pause & goto dismconsole
if /I "%choice%"=="4" goto netfx
if /I "%choice%"=="5" DISM /Online /Enable-Feature /FeatureName:DirectPlay /All & powershell -c (New-Object Media.SoundPlayer "%SystemRoot%\Media\tada.wav").PlaySync(); & pause & goto dismconsole
if /I "%choice%"=="6" goto DriverExport
if /I "%choice%"=="7" dism /online /get-packages | more & pause & goto dismconsole

if /I "%choice%"=="H" goto Help
if /I "%choice%"=="M" goto menu
if /I "%choice%"=="X" exit
echo Invalid choice, try again.
pause
goto dismconsole

REM Очистка ПК від сміття

:: ---------------- Deep Cleaner ----------------
:Deep_Cleaner
color 0F
cls
echo ====================================================
echo    DEEP CLEANER
echo ====================================================
echo Press key [1] = Clear the update cache
echo Press key [2] = Clear Temp files
echo Press key [3] = Clean Manager
echo Press key [4] = Delete folder "Windows.old" (WARNING! THIS ACTION CANNOT BE UNDONE AND SYSTEM ROLLBACK WILL BE UNAVAILABLE.)
echo Press key [5] = Clean Microsoft Store cache
echo Press key [6] = Clean DNS cache
echo.
echo ====================================================
echo Press [Alt+ENTER] = Full screen mode ON \ OFF
echo Press key [H] = HELP
echo Press key [M] = Main menu
echo Press key [X] = EXIT
echo ====================================================
set /p choice=Select an action and press ENTER = 
echo ====================================================

if "%choice%"=="1" goto DISM_cleanup
if "%choice%"=="2" goto tempclean
if "%choice%"=="3" start cleanmgr & pause & goto backcleaner
if "%choice%"=="4" goto dellwindowsold & pause
if "%choice%"=="5" start "" "%SystemRoot%\System32\wsreset.exe"
if "%choice%"=="6" ipconfig /flushdns & pause

if /I "%choice%"=="H" goto Help
if /I "%choice%"=="M" goto menu
if /I "%choice%"=="X" goto end
echo Invalid choice, try again.
pause
goto Deep_Cleaner

:DISM_cleanup
color 0F
cls
echo ====================================================
echo    DISM UPDATE CLEANER
echo ====================================================
echo Press key [1] = Analize update cache
echo Press key [2] = Clear the update cache
echo Press key [3] = Clear the update cache (Deep mode) (WARNING! THIS ACTION CAN NOT BE UNDONE, AND UPDATE ROLLBACK WILL BE UNAVAILABLE)
echo.
echo ====================================================
echo Press [Alt+ENTER] = Full screen mode ON \ OFF
echo Press key [H] = HELP
echo Press key [M] = Main menu
echo Press key [X] = EXIT
echo ====================================================
set /p choice=Select an action and press ENTER = 
echo ====================================================
echo Clearing the update cache...

if "%choice%"=="1" dism /online /cleanup-image /AnalizeComponentStore & powershell -c (New-Object Media.SoundPlayer "%SystemRoot%\Media\tada.wav").PlaySync();
if "%choice%"=="2" dism /online /cleanup-image /StartComponentCleanup & powershell -c (New-Object Media.SoundPlayer "%SystemRoot%\Media\tada.wav").PlaySync();
if "%choice%"=="3" dism /online /cleanup-image /StartComponentCleanup /ResetBase & powershell -c (New-Object Media.SoundPlayer "%SystemRoot%\Media\tada.wav").PlaySync();

if /I "%choice%"=="H" goto Help
if /I "%choice%"=="M" goto menu
if /I "%choice%"=="X" goto end
pause
goto Deep_Cleaner
goto backcleaner

:tempclean
echo Cleaning temp files...
del /s /q %temp%\*.*
del /s /q C:\Windows\Temp\*.*
del /s /q C:\Windows\Prefetch\*.*
del /s /q C:\Windows\SoftwareDistribution\*.*
del /s /q C:\Windows\SystemTemp\*.*
del /s /q C:\Windows\Logs\*.*
del /s /q C:\Windows\Installer\*.*
del /s /q C:\Program Files (x86)\Microsoft\Temp\*.*
del /s /q C:\Program Files (x86)\Microsoft\EdgeUpdate\Download\*.*
echo ----------------------------------
echo Temp files have been cleaned!
echo ----------------------------------
goto backcleaner

:backcleaner
powershell -c (New-Object Media.SoundPlayer "%SystemRoot%\Media\tada.wav").PlaySync();
pause
goto Deep_Cleaner

set /p back=
if /I "%choice%"=="H" goto Help
if /I "%choice%"=="M" goto menu
if /I "%choice%"=="X" goto end
echo Invalid choice, try again.
pause
goto backcleaner

REM Перезавантаження, вимкнення

:: ---------------- Shutdown console ----------------
:Shutdown_console
color 0E
cls
echo ====================================================
echo    SHUTDOWN CONSOLE
echo ====================================================
echo.
echo Press key [1] = Hibernate PC
echo Press key [2] = Shutdown PC
echo Press key [3] = Reboot PC
echo Press key [4] = Special loading options mode
echo Press key [5] = Find the BOOT MENU Key
echo Press key [6] = Find the BIOS \ UEFI Key
echo Press key [7] = Find the RECOVERY Key
echo Press key [8] = Reboot to BIOS \ UEFI
echo Press key [9] = Reboot to RECOVERY MODE
echo.
echo ====================================================
echo Press [Alt+ENTER] = Full screen mode ON \ OFF
echo Press key [H] = HELP
echo Press key [M] = Main menu
echo Press key [X] = EXIT
echo ====================================================
set /p choice=Select an action and press ENTER = 
echo ====================================================

if "%choice%"=="1" shutdown /h & exit
if "%choice%"=="2" shutdown /s /t 0
if "%choice%"=="3" shutdown /r /f /t 0
if "%choice%"=="4" shutdown /r /o /t 0
if "%choice%"=="5" goto BootMenu
if "%choice%"=="6" goto BIOSSetup
if "%choice%"=="7" goto RecoveryMode
if "%choice%"=="8" shutdown /r /fw
if "%choice%"=="9" shutdown /r /o /t 0

if /I "%choice%"=="M" goto menu
if /I "%choice%"=="X" goto end
echo Invalid choice, try again.
pause
goto Shutdown_console

REM BOOT MENU

:: ---------------- BOOT MENU ----------------
:BootMenu
color 0F
setlocal EnableDelayedExpansion
title Boot Menu

echo.
echo ====================================================
echo    Check for support /fw
echo ====================================================
echo.

wmic computersystem get manufacturer > manufacturer.txt
set "fwSupport=0"

:: Check for support /fw
shutdown /fw /t 0 /c "Support test /fw" >nul 2>&1
if %errorlevel%==0 (
    set "fwSupport=1"
)

:: Manufacturer receipt
for /f "skip=1 tokens=* delims=" %%a in (manufacturer.txt) do set "vendor=%%a"
del manufacturer.txt

:: Key output Boot Menu
echo Label: !vendor!
echo.

set "key=F12"
if /i "!vendor!"=="ASUS" set "key=F8"
if /i "!vendor!"=="Gigabyte" set "key=F12"
if /i "!vendor!"=="MSI" set "key=F11 or F3"
if /i "!vendor!"=="HP" set "key=Esc or F9"
if /i "!vendor!"=="Dell" set "key=F12"
if /i "!vendor!"=="Lenovo" set "key=F12 or Enter or F11"
if /i "!vendor!"=="Acer" set "key=F12 or F10"
if /i "!vendor!"=="eMachines" set "key=F12"
if /i "!vendor!"=="Packard Bell" set "key=F12 or F10 or F8"
if /i "!vendor!"=="Samsung" set "key=Esc or F4"
if /i "!vendor!"=="Toshiba" set "key=F8 or F11"
if /i "!vendor!"=="Sony Vaio" set "key=F11 or Esc or F10"
if /i "!vendor!"=="Fujitsu Siemens" set "key=F12"

echo ====================================================
echo Manufacturer detected: !vendor!
echo ----------------------------------------------------
echo Boot Menu key: !key!
echo ====================================================

:: Reboot confirmation
if "!fwSupport!"=="1" (
    echo The system supports the transition to UEFI over /fw.
    echo.
    choice /m "Do you want to reboot with a transition to Boot Menu?"
    if errorlevel 2 (
        echo Abolition.
        pause
    ) else (
        shutdown /r /fw /t 0
    )
) else (
    echo Warning: /fw is not supported on your system.
    echo Please reboot manually and press !key! at startup.
    pause
)

endlocal
goto Shutdown_console

REM Клавіші для BIOS / UEFI

:: ---------------- BIOS SETUP ----------------
:BIOSSetup
color 0F
setlocal EnableDelayedExpansion
title BIOS Setup

echo.
echo ====================================================
echo    BIOS / UEFI Setup Keys
echo ====================================================
echo.

wmic computersystem get manufacturer > manufacturer.txt
for /f "skip=1 tokens=* delims=" %%a in (manufacturer.txt) do set "vendor=%%a"
del manufacturer.txt

set "biosKey=Del"
if /i "!vendor!"=="ASUS" set "biosKey=Delete or F2 or Esc or Fn+F2"
if /i "!vendor!"=="Gigabyte" set "biosKey=Delete"
if /i "!vendor!"=="MSI" set "biosKey=Delete"
if /i "!vendor!"=="HP" set "biosKey=Esc or F10 or F1 or F2"
if /i "!vendor!"=="Dell" set "biosKey=F2 or Delete"
if /i "!vendor!"=="Lenovo" set "biosKey=F1 or F2 or F12 or Fn+F2"
if /i "!vendor!"=="Acer" set "biosKey=F2 or Delete or F1 or Esc or Ctrl+Alt"
if /i "!vendor!"=="Samsung" set "biosKey=F2 or Delete"
if /i "!vendor!"=="Toshiba" set "biosKey=F2 or Esc or F1 or F12"
if /i "!vendor!"=="Sony Vaio" set "biosKey=F2 or F3 or F1 or Delete or assist"
if /i "!vendor!"=="Fujitsu Siemens" set "biosKey=F2"
if /i "!vendor!"=="eMachines" set "biosKey=F2 or Delete"
if /i "!vendor!"=="Packard Bell" set "biosKey=F2 or Delete"

echo ====================================================
echo Manufacturer detected: !vendor!
echo ----------------------------------------------------
echo BIOS/UEFI Setup key: !biosKey!
echo ====================================================

pause
endlocal
goto Shutdown_console

REM Клавіші для RECOVERY MODE

:: ---------------- RECOVERY MODE ----------------
:RecoveryMode
color 0F
setlocal EnableDelayedExpansion
title Recovery Mode

echo.
echo ====================================================
echo    Recovery Mode Keys
echo ====================================================
echo.

wmic computersystem get manufacturer > manufacturer.txt
for /f "skip=1 tokens=* delims=" %%a in (manufacturer.txt) do set "vendor=%%a"
del manufacturer.txt

set "recKey=F9"
if /i "!vendor!"=="ASUS" set "recKey=F9"
if /i "!vendor!"=="HP" set "recKey=F11"
if /i "!vendor!"=="Dell" set "recKey=Ctrl+F11"
if /i "!vendor!"=="Lenovo" set "recKey=F11 or Novo button or F8 or 0 (zero)"
if /i "!vendor!"=="Acer" set "recKey=Alt+F10"
if /i "!vendor!"=="Samsung" set "recKey=F4"
if /i "!vendor!"=="Toshiba" set "recKey=0 (zero) or F8 or Fn+0 (zero)"
if /i "!vendor!"=="Sony Vaio" set "recKey=Assist button or F10"
if /i "!vendor!"=="Fujitsu Siemens" set "recKey=F12 or F8 or 0 (zero) or Fn+0 (zero)"
if /i "!vendor!"=="eMachines" set "recKey=Alt+F10"
if /i "!vendor!"=="MSI" set "recKey=F3"
if /i "!vendor!"=="Packard Bell" set "recKey=F10"

echo ====================================================
echo Manufacturer detected: !vendor!
echo ----------------------------------------------------
echo Recovery Mode key: !recKey!
echo ====================================================

pause
endlocal
goto Shutdown_console

REM Встановлення .NET Framework

:netfx
cls
echo ====================================================
echo    .NET Framework 3.5 Installer
echo ====================================================
echo Searching installation media...
set found=0

for %%d in (D E F G H I J K L M N O P Q R S T U V W X Y Z) do (
    if exist %%d:\sources\sxs (
        echo Found source at %%d:\
        set found=1
        dism /online /enable-feature /featurename:NetFx3 /All /Source:%%d:\sources\sxs /LimitAccess
        goto backnetfx
    )
)

if %found%==0 (
    echo -----------------------------------------------------------------
    echo    No installation media found.
    echo -----------------------------------------------------------------
    echo    Please insert DVD/USB or mount ISO with \sources\sxs folder.
    echo -----------------------------------------------------------------
)
goto backnetfx

:backnetfx
pause
goto dismconsole

REM Експорт драйверів

:DriverExport
@echo off
title Export drivers
color 0A

:: Список дисків для перевірки
set "driveList=D E F G H I J K L M N O P Q R S T U V W X Y Z C"

:: Змінна для цільової папки
set "driverDir="

for %%d in (%driveList%) do (
    if exist %%d:\ (
        set "driverDir=%%d:\MyDrivers"
        goto FOUND
    )
)

:FOUND
if "%driverDir%"=="" (
    echo No available drives found!
    goto dismconsole
)

:: Перевірка існування папки, створення якщо немає
if not exist "%driverDir%" (
    echo Creating folder %driverDir%...
    mkdir "%driverDir%"
)

:: Експорт драйверів
echo Driver export to %driverDir%...
echo PLEASE DO NOT CLOSE THE WINDOW UNTIL THE OPERATION IS COMPLETE!
DISM /Online /Export-Driver /Destination:"%driverDir%"

:: Відкрити папку після завершення
start "" "%driverDir%"

:: Звуковий сигнал
powershell -c (New-Object Media.SoundPlayer "%SystemRoot%\Media\Alarm01.wav").PlaySync();

pause
goto dismconsole

REM Видалення папки Windows.old

:dellwindowsold
title Removind Windows.old
color 0C

echo =======================================================================
echo    WARNING! - YOU ARE ABOUT TO DELETE THE "Windows.old" FOLDER.
echo    THIS ACTION CANNOT BE UNDONE AND SYSTEM ROLLBACK WILL BE UNAVAILABLE.
echo =======================================================================
echo.
echo ---------------------------------------------------------------
set /p confirm1=Are you sure you want to continue? (Y = YES N = NO):
echo ---------------------------------------------------------------
if /I not "%confirm1%"=="Y" goto Deep_Cleaner

echo.
echo ----------------------------------------------------------------
set /p confirm2=Confirm removal again. Windows.old (Y = YES N = NO):
echo ----------------------------------------------------------------
if /I not "%confirm2%"=="Y" goto Deep_Cleaner

echo -----------------------------------
echo Removal folder Windows.old...
echo -----------------------------------
rd /s /q C:\Windows.old

echo ------------------------------------------------
echo    Folder Windows.old Deleted successfully!
echo ------------------------------------------------

pause
goto Deep_Cleaner

REM Обслуговування дисків

:: ---------------- HDD \ SSD \ USB Servise ---------
@echo off
title HDD \ SSD \ USB Servise

:HDD_SSD_USB
color 0F
cls
echo ====================================================
echo    HDD \ SSD \ USB Servise
echo ====================================================
echo.
echo Press key [1] = DISKPART console
echo Press key [2] = Robocopy console
echo Press key [3] = Disk Pre-Diagnostics
echo Press key [4] = Disc manager
echo Press key [5] = TRIM (FOR SSD ONLY)
echo.
echo ====================================================
echo Press [Alt+ENTER] = Full screen mode ON \ OFF
echo Press key [H] = HELP
echo Press key [M] = return to Main menu
echo Press key [X] = EXIT
echo ====================================================
set /p choice=Select an action and press ENTER = 
echo ====================================================
echo.

if /I "%choice%"=="1" goto DISKPART
if /I "%choice%"=="2" goto Robocopy
if /I "%choice%"=="3" goto Disk_Pre_Diagnostics
if /I "%choice%"=="4" start diskmgmt.msc & goto HDD_SSD_USB
if /I "%choice%"=="5" goto TRIM

if /I "%choice%"=="H" goto Help
if /I "%choice%"=="M" goto menu
if /I "%choice%"=="X" goto end
echo Invalid choice, try again.
pause
goto HDD_SSD_USB

REM Утиліта DISKPART

:: ---------------- DISKPART_console ----------------
@echo off
title DiskPart Utility Console

:DISKPART
color 0C
cls
echo ====================================================
echo    DISKPART console
echo ====================================================
echo. 
echo ----------------------------------------------------
echo    WARNING!
echo ----------------------------------------------------
echo  - DiskPart can delete partitions and format disks.
echo  - Be careful when choosing a disk number!
echo  - All data on the selected disk may be lost.
echo  - Run the utility ONLY as an administrator.
echo ----------------------------------------------------
echo    Basic rules:
echo ----------------------------------------------------
echo  1. First use "List disks".
echo  2. Make sure you have selected the correct disk.
echo  3. Before formatting or clean, the utility will ask for confirmation.
echo  4. If you are not sure, it is better not to perform the action.
echo -----------------------------------------------------
echo. 

echo Press key [1] = List disks
echo Press key [2] = List volumes
echo Press key [3] = Create new partition (WARNING!)
echo Press key [4] = Format volume (WARNING!)
echo Press key [5] = Assign a drive letter
echo Press key [6] = Quick format Flash Drive (WARNING!)
echo Press key [7] = Full disk cleaning (WARNING!)
echo Press key [8] = Info about disk
echo.
echo ====================================================
echo Press [Alt+ENTER] = Full screen mode ON \ OFF
echo Press key [H] = HELP
echo Press key [M] = Main menu
echo Press key [X] = EXIT
echo ====================================================
set /p choice=Select an action and press ENTER = 
echo ====================================================

if "%choice%"=="1" goto LISTDISK
if "%choice%"=="2" goto LISTVOL
if "%choice%"=="3" goto CREATEPART
if "%choice%"=="4" goto FORMAT
if "%choice%"=="5" goto ASSIGN
if "%choice%"=="6" goto QUICKUSB
if "%choice%"=="7" goto CLEANDISK
if "%choice%"=="8" goto DISKINFO

if /I "%choice%"=="H" goto Help
if /I "%choice%"=="M" goto menu
if /I "%choice%"=="X" goto end
echo Invalid choice, try again.
pause
goto DISKPART

:LISTDISK
cls
echo Listing all disks...
echo list disk > temp.txt
diskpart /s temp.txt
del temp.txt
pause
goto DISKPART

:LISTVOL
cls
echo Listing all volumes...
echo list volume > temp.txt
diskpart /s temp.txt
del temp.txt
pause
goto DISKPART

:CREATEPART
cls
set /p disknum=Enter disk number: 
echo select disk %disknum% > temp.txt
echo create partition primary >> temp.txt
diskpart /s temp.txt
del temp.txt
pause
goto DISKPART

:FORMAT
cls
set /p volnum=Enter volume number:

echo ----------------------------------------------------
echo    Select filesystem type:
echo ----------------------------------------------------
echo.
echo Press key [1] = NTFS
echo Press key [2] = FAT32
echo Press key [3] = exFAT
echo ----------------------------------------------------
set /p fstype=Choose option (1-3):

if "%fstype%"=="1" set fs=ntfs
if "%fstype%"=="2" set fs=fat32
if "%fstype%"=="3" set fs=exfat

:: Захисний блок перед форматуванням
echo ====================================================
echo Press key [H] = HELP
echo Press key [M] = Main menu
echo Press key [X] = EXIT
echo ====================================================
echo    Press [Enter] to continue formatting
echo ====================================================
set /p choice=Your choice =  

if /I "%choice%"=="H" goto Help
if /I "%choice%"=="M" goto DISKPART
if /I "%choice%"=="X" goto end
echo Invalid choice, try again.

:: Форматування
echo select volume %volnum% > temp.txt
echo format fs=%fs% quick >> temp.txt
diskpart /s temp.txt
del temp.txt
powershell -c (New-Object Media.SoundPlayer "%SystemRoot%\Media\tada.wav").PlaySync();
pause
goto DISKPART

:ASSIGN
cls
set /p volnum=Enter volume number: 
set /p letter=Enter drive letter: 
echo select volume %volnum% > temp.txt
echo assign letter=%letter% >> temp.txt
diskpart /s temp.txt
del temp.txt
pause
goto DISKPART

:QUICKUSB
cls
set /p disknum=Enter Flash drive number (disk):

echo ----------------------------------------------------
echo    Select filesystem type:
echo ----------------------------------------------------
echo.
echo Press key [1] = NTFS
echo Press key [2] = FAT32
echo Press key [3] = exFAT
echo ----------------------------------------------------
set /p fstype=Choose option (1-3):

if "%fstype%"=="1" set fs=ntfs
if "%fstype%"=="2" set fs=fat32
if "%fstype%"=="3" set fs=exfat

:: Захисний блок перед форматуванням
echo ====================================================
echo Press key [H] = HELP
echo Press key [M] = Main menu
echo Press key [X] = EXIT
echo ====================================================
echo    Press [Enter] to continue formatting
echo ====================================================
set /p choice=Your choice = 

if /I "%choice%"=="H" goto Help
if /I "%choice%"=="M" goto DISKPART
if /I "%choice%"=="X" goto end
echo Invalid choice, try again.

:: Форматування
echo select disk %disknum% > temp.txt
echo clean >> temp.txt
echo create partition primary >> temp.txt
echo format fs=%fs% quick >> temp.txt
echo assign >> temp.txt
diskpart /s temp.txt
del temp.txt
echo The flash drive is formatted as %fs% successfully and ready to use.
powershell -c (New-Object Media.SoundPlayer "%SystemRoot%\Media\tada.wav").PlaySync();
pause
goto DISKPART

:CLEANDISK
cls
echo ----------------------------------------------------
set /p disknum=Enter the disk number to clean: 
echo ----------------------------------------------------
echo.
echo ---------------------------------------------------------------------
echo    WARNING! - This will delete all partitions on the disk %disknum%.
echo ---------------------------------------------------------------------
set /p confirm=Are you sure? (Y = YES / N = NO):
echo ---------------------------------------------------------------------
if /I "%confirm%"=="Y" (
    echo select disk %disknum% > temp.txt
    echo clean >> temp.txt
    diskpart /s temp.txt
    del temp.txt
    echo ----------------------------------------------------
    echo    Disk cleared.
    echo ----------------------------------------------------
) else (
    echo ----------------------------------------------------
    echo    Operation canceled.
    echo ----------------------------------------------------
)
powershell -c (New-Object Media.SoundPlayer "%SystemRoot%\Media\tada.wav").PlaySync();
pause
goto DISKPART

:DISKINFO
cls
set /p disknum=Enter disk number: 
echo select disk %disknum% > temp.txt
echo detail disk >> temp.txt
diskpart /s temp.txt
del temp.txt
pause
goto DISKPART

REM Утиліта Robocopy

:: BridgeSmith Robocopy Module
@echo off
title BridgeSmith - Robocopy Utility
color 0F

:Robocopy
cls
echo ====================================================
echo    Robocopy console
echo ====================================================
echo Press key [1] = Simple folder copy
echo Press key [2] = Mirroring (/MIR)
echo Press key [3] = Copy only certain types of files
echo Press key [4] = Copy with log to file
echo.
echo ====================================================
echo Press Alt+ENTER = Full screen mode ON \ OFF
echo Press key [H] = HELP
echo Press key [M] = Main menu
echo Press key [X] = EXIT
echo ====================================================
set /p choice=Select an action and press ENTER = 
echo ====================================================

if "%choice%"=="1" goto SIMPLE
if "%choice%"=="2" goto MIRROR
if "%choice%"=="3" goto FILTER
if "%choice%"=="4" goto LOG

if /I "%choice%"=="H" goto Help
if /I "%choice%"=="M" goto menu
if /I "%choice%"=="X" goto end
echo Invalid choice, try again.
pause
goto Robocopy

:SIMPLE
echo ====================================================
set /p src=Please provide a source:
echo ----------------------------------------------------
set /p dst=Please provide a destination:
echo ====================================================
robocopy "%src%" "%dst%"
powershell -c (New-Object Media.SoundPlayer "%SystemRoot%\Media\Alarm01.wav").PlaySync();
pause
goto Robocopy

:MIRROR
echo ====================================================
set /p src=Please provide a source:
echo ----------------------------------------------------
set /p dst=Please provide a destination:
echo ====================================================
robocopy "%src%" "%dst%" /MIR
powershell -c (New-Object Media.SoundPlayer "%SystemRoot%\Media\Alarm01.wav").PlaySync();
pause
goto Robocopy

:FILTER
echo =====================================================
set /p src=Please provide a source:
echo -----------------------------------------------------
set /p dst=Please provide a destination:
echo -----------------------------------------------------
set /p ext=Specify file extensions (for example *.mp3):
echo =====================================================
robocopy "%src%" "%dst%" %ext%
powershell -c (New-Object Media.SoundPlayer "%SystemRoot%\Media\Alarm01.wav").PlaySync();
pause
goto Robocopy

:LOG
echo ======================================================
set /p src=Please provide a source.:
echo ------------------------------------------------------
set /p dst=Please provide a destination:
echo ------------------------------------------------------
set /p logfile=Enter the path to the log file:
echo ======================================================
robocopy "%src%" "%dst%" /LOG:"%logfile%"
powershell -c (New-Object Media.SoundPlayer "%SystemRoot%\Media\Alarm01.wav").PlaySync();
pause
goto Robocopy

REM Тест на відтворення звуку

:play_sound
@echo off
powershell -c (New-Object Media.SoundPlayer "%SystemRoot%\Media\Alarm01.wav").PlaySync();
pause
goto Utilities_console

REM Тест диска

:Disk_Pre_Diagnostics
@echo off
color 0F
cls
echo ====================================================
echo    Disk Pre-Diagnostics
echo ====================================================
echo.
echo Press key [1] = Check the SMART status of the disk
echo Press key [2] = Fast read test (1000 MB)
echo Press key [3] = Surface test (slow)
echo.
echo ====================================================
echo Press [Alt+ENTER] = Full screen mode ON \ OFF
echo Press key [H] = HELP
echo Press key [M] = Main menu
echo Press key [X] = EXIT
echo ====================================================
set /p choice=Select an action and press ENTER = 
echo ====================================================

if /I "%choice%"=="1" goto smart
if /I "%choice%"=="2" goto quicktest
if /I "%choice%"=="3" goto surfacetest

if /I "%choice%"=="H" goto Help
if /I "%choice%"=="M" goto menu
if /I "%choice%"=="X" goto end
echo Invalid choice, try again.
pause
goto Disk_Pre_Diagnostics

:smart
cls
echo === SMART-disk status ===
wmic diskdrive get status,model,size
echo.
powershell -c (New-Object Media.SoundPlayer "%SystemRoot%\Media\tada.wav").PlaySync();
pause
goto Disk_Pre_Diagnostics

:quicktest
cls
echo === Quick reading test (1000 MB) ===
echo Running test...
powershell -command "Get-Content \\.\PhysicalDrive0 -ReadCount 0 -TotalCount 1048576 | Out-Null"
echo Complete.
powershell -c (New-Object Media.SoundPlayer "%SystemRoot%\Media\tada.wav").PlaySync();
pause
goto Disk_Pre_Diagnostics

:surfacetest
cls
echo === Disk surface test ===
echo Warning: this may take a long time!
echo ---------------------------------------------------------------------------
echo Use utilities like: HDDScan or Victoria for a deep check.
echo ---------------------------------------------------------------------------
echo Use utilities like: Robocopy or Non Stop Copy for a copying your files.
echo ---------------------------------------------------------------------------

pause
goto Disk_Pre_Diagnostics

REM TRIM

:TRIM

 color 0F
cls
echo ====================================================
echo    TRIM (FOR SSD ONLY)
echo ====================================================
echo.
echo Press key [1] = Checking TRIM status 
echo Press key [2] = Enabling TRIM
echo Press key [3] = Disabling TRIM
echo.
echo ====================================================
echo Press [Alt+ENTER] = Full screen mode ON \ OFF
echo Press key [H] = HELP
echo Press key [M] = Main menu
echo Press key [X] = EXIT
echo ====================================================
set /p choice=Select an action and press ENTER = 
echo ====================================================

if /I "%choice%"=="1" fsutil behavior query DisableDeleteNotify
if /I "%choice%"=="2" fsutil behavior set DisableDeleteNotify 0
if /I "%choice%"=="3" fsutil behavior set DisableDeleteNotify 1

if /I "%choice%"=="H" goto Help
if /I "%choice%"=="M" goto menu
if /I "%choice%"=="X" goto end
echo Invalid choice, try again.
pause
goto TRIM


REM Additional_Windows_settings

:Additional_Windows_settings
color 0D
cls
echo ====================================================
echo    Additional Windows settings
echo ====================================================
echo. 
echo Press key [1] = Set Force terminating programs automatically in 5 sec (In case if not request)
echo Press key [2] = Set Automatically reboot your PC (in case of BSOD)
echo Press key [3] = Set Automatically restart Explorer (In case if not request)
echo Press key [4] = Set Improving security (Shutdown will be longer)
echo Press key [5] = Set Improving compatibility (For old programms and games)
echo Press key [6] = Enable Default Photo viewer (As Windows 7)
echo Press key [7] = Add \ remove items in Desktop context menu
echo Press key [8] = Add \ remove GOD MODE folder (Extended control panel \ analog of classic control panel)
echo Press key [9] = Disable avto Winlogon (In case if you have more than 1 local user account)
echo Press key [10] = Hibernation ON \ OFF
echo Press key [11] = Set High PC performance
echo.
echo ====================================================
echo Press [Alt+ENTER] = Full screen mode ON \ OFF
echo Press key [H] = HELP
echo Press key [M] = Main menu
echo Press key [X] = EXIT
echo ====================================================
set /p choice=Select an action and press ENTER = 
echo ====================================================

if /I "%choice%"=="1" goto Force_terminating_programs
if /I "%choice%"=="2" goto BSOD_reboot_PC
if /I "%choice%"=="3" goto Automatically_restart_Explorer
if /I "%choice%"=="4" goto Improving_security
if /I "%choice%"=="5" goto Improving_compatibility
if /I "%choice%"=="6" goto Default_Photo
if /I "%choice%"=="7" goto Desktop_menu
if /I "%choice%"=="8" goto GOD_MODE
if /I "%choice%"=="9" goto WinlogonOff
if /I "%choice%"=="10" goto Hibernation
if /I "%choice%"=="10" powercfg -duplicatescheme e9a42b02-d5df-448d-aa00-03f14749eb61 

if /I "%choice%"=="H" goto Help
if /I "%choice%"=="M" goto menu
if /I "%choice%"=="X" goto end
echo Invalid choice, try again.
pause
goto Additional_Windows_settings

REM Принудительное завершение программ

:Force_terminating_programs

:: WaitToKillAppTimeout — час очікування перед примусовим завершенням програм при виході
reg add "HKCU\Control Panel\Desktop" /v WaitToKillAppTimeout /t REG_SZ /d 5000 /f

:: HungAppTimeout — час очікування відповіді від завислої програми
reg add "HKCU\Control Panel\Desktop" /v HungAppTimeout /t REG_SZ /d 5000 /f

:: Closing_frozen_programs - Автозавершення завислих програм

reg add "HKCU\Control Panel\Desktop" /v AutoEndTasks /t REG_SZ /d 1 /f

@echo off
powershell -c (New-Object Media.SoundPlayer "%SystemRoot%\Media\tada.wav").PlaySync();
pause
goto Additional_Windows_settings

REM Автоматическая перезагрузка ПК в случае сбоя

:BSOD_reboot_PC

reg add "HKLM\SYSTEM\CurrentControlSet\Control\CrashControl" /v AutoReboot /t REG_DWORD /d 1 /f

@echo off
powershell -c (New-Object Media.SoundPlayer "%SystemRoot%\Media\tada.wav").PlaySync();
pause
goto Additional_Windows_settings

REM Авоматическая перезагрузка Проводника в случае сбоя

:Automatically_restart_Explorer

reg add "HKCU\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" /v AutoRestartShell /t REG_DWORD /d 1 /f

@echo off
powershell -c (New-Object Media.SoundPlayer "%SystemRoot%\Media\tada.wav").PlaySync();
pause
goto Additional_Windows_settings

REM Улучшение защищённости

:Improving_security

reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v ClearPageFileAtShutdown /t REG_DWORD /d 1 /f

@echo off
powershell -c (New-Object Media.SoundPlayer "%SystemRoot%\Media\tada.wav").PlaySync();
pause
goto Additional_Windows_settings

REM Улучшение совместимости со старыми программами

:Improving_compatibility

reg add "HKLM\SYSTEM\CurrentControlSet\Control\WOW" /v DefaultSeparateVDM /t REG_SZ /d Yes /f

@echo off
powershell -c (New-Object Media.SoundPlayer "%SystemRoot%\Media\tada.wav").PlaySync();
pause
goto Additional_Windows_settings

REM Восстановление стандартного просмотрщика фотографий Windows

:Default_Photo

:: Створюємо гілку для Photo Viewer
reg add "HKCR\Applications\photoviewer.dll" /f
reg add "HKCR\Applications\photoviewer.dll\shell" /f

:: Додаємо пункт "Відкрити"
reg add "HKCR\Applications\photoviewer.dll\shell\open" /v MuiVerb /t REG_SZ /d "@photoviewer.dll,-3043" /f

:: Команда для відкриття
reg add "HKCR\Applications\photoviewer.dll\shell\open\command" /ve /t REG_EXPAND_SZ /d "\"%SystemRoot%\\System32\\rundll32.exe\" \"%ProgramFiles%\\Windows Photo Viewer\\PhotoViewer.dll\", ImageView_Fullscreen %1" /f

:: DropTarget для відкриття
reg add "HKCR\Applications\photoviewer.dll\shell\open\DropTarget" /v Clsid /t REG_SZ /d "{FFE2A43C-56B9-4bf5-9A79-CC6D4285608A}" /f

:: Додаємо пункт "Друк"
reg add "HKCR\Applications\photoviewer.dll\shell\print" /f

:: Команда для друку
reg add "HKCR\Applications\photoviewer.dll\shell\print\command" /ve /t REG_EXPAND_SZ /d "\"%SystemRoot%\\System32\\rundll32.exe\" \"%ProgramFiles%\\Windows Photo Viewer\\PhotoViewer.dll\", ImageView_PrintTo %1" /f

:: DropTarget для друку
reg add "HKCR\Applications\photoviewer.dll\shell\print\DropTarget" /v Clsid /t REG_SZ /d "{60fd46de-f830-4894-a628-6fa81bc0190d}" /f

@echo off
powershell -c (New-Object Media.SoundPlayer "%SystemRoot%\Media\tada.wav").PlaySync();
echo.
echo Win7 Photo Viewer enabled successfully
pause
goto Additional_Windows_settings

REM Вимкнення автоматичного входу в локальний запис

:WinlogonOff

reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" /v AutoAdminLogon /t REG_SZ /d 0 /f
reg delete "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" /v DefaultUserName /f
reg delete "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" /v DefaultPassword /f
reg delete "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" /v AutoLogonSID /f
@echo off
powershell -c (New-Object Media.SoundPlayer "%SystemRoot%\Media\tada.wav").PlaySync();
echo.
echo Avto WinLogon disabled successfully.
pause
goto Additional_Windows_settings

REM GOD MODE

:GOD_MODE

color 02
cls
echo ====================================================
echo    GOD MODE (Extended control panel analog)
echo ====================================================
echo.
echo Press key [1] = Add GOD MODE folder 
echo Press key [2] = Remove GOD MODE folder
echo.
echo ====================================================
echo Press [Alt+ENTER] = Full screen mode ON \ OFF
echo Press key [H] = HELP
echo Press key [M] = Main menu
echo Press key [X] = EXIT
echo ====================================================
set /p choice=Select an action and press ENTER = 
echo ====================================================

if /I "%choice%"=="1" goto Create_GOD_MODE
if /I "%choice%"=="2" goto Remove_GOD_MODE

if /I "%choice%"=="H" goto Help
if /I "%choice%"=="M" goto menu
if /I "%choice%"=="X" goto end
echo Invalid choice, try again.

:Create_GOD_MODE

@echo off
chcp 65001 >nul

:: Шлях до папки "Документи" (універсальний, незалежно від локалізації)
set "godPath=%USERPROFILE%\Documents\GodMode.{ED7BA470-8E54-465E-825C-99712043E01C}"

:: Перевірка, чи вже існує
if exist "%godPath%" (
    echo The God Mode folder already exists in Documents.
) else (
    mkdir "%godPath%"
    echo God Mode folder created in Documents: successfully.
)
@echo off
powershell -c (New-Object Media.SoundPlayer "%SystemRoot%\Media\tada.wav").PlaySync();
pause
goto GOD_MODE

------------------------------------

:Remove_GOD_MODE

@echo off
chcp 65001 >nul

:: Шлях до God Mode у "Документах"
set "godPath=%USERPROFILE%\Documents\GodMode.{ED7BA470-8E54-465E-825C-99712043E01C}"

:: Перевірка наявності
if exist "%godPath%" (
    rd /s /q "%godPath%"
    echo Folder God Mode has been deleted in Documents: successfully.
) else (
    echo Folder God Mode not found.
)
@echo off
powershell -c (New-Object Media.SoundPlayer "%SystemRoot%\Media\tada.wav").PlaySync();
pause
goto GOD_MODE

-------------------------------------

REM Hibernation ON \ OFF

:Hibernation

color 02
cls
echo ====================================================
echo    Hibernation ON \ OFF
echo ====================================================
echo.
echo Press key [1] = Enable Hibernation 
echo Press key [2] = Disable Hibernation
echo.
echo ====================================================
echo Press [Alt+ENTER] = Full screen mode ON \ OFF
echo Press key [H] = HELP
echo Press key [M] = Main menu
echo Press key [X] = EXIT
echo ====================================================
set /p choice=Select an action and press ENTER = 
echo ====================================================

if /I "%choice%"=="1" powercfg -h on  & echo Hibernation was enabled successfully
if /I "%choice%"=="2" powercfg -h off & echo Hibernation was disabled successfully

if /I "%choice%"=="H" goto Help
if /I "%choice%"=="M" goto menu
if /I "%choice%"=="X" goto end
echo Invalid choice, try again.

powershell -c (New-Object Media.SoundPlayer "%SystemRoot%\Media\tada.wav").PlaySync();
pause
goto Hibernation

-------------------------------------

REM Контекстне меню робочого стола

:: ===== Desktop menu =====
:Desktop_menu
color 02
cls
echo ====================================================
echo    Desktop menu
echo ====================================================
echo.
echo.
echo     RESTART EXPLORER
echo  ---------------------------------------------------
echo Press key [1] = Add item "Restart explorer"
echo Press key [2] = Remove item "Restart explorer"
echo.
echo     BLUETOOTH
echo  ---------------------------------------------------
echo Press key [3] = Add item "Share via Bluetooth"
echo Press key [4] = Remove item "Share via Bluetooth"
echo.
echo     SHUTDOWN MENU
echo  ---------------------------------------------------
echo Press key [5] = Add item "Shutdown menu"
echo Press key [6] = Remove item "Shutdown menu"
echo.
echo ====================================================
echo Press [Alt+ENTER] = Full screen mode ON \ OFF
echo Press key [H] = HELP]
echo Press key [M] = Main menu
echo Press key [X] = EXIT
echo ====================================================
set /p choice=Select an action and press ENTER = 
echo ====================================================

if "%choice%"=="1" goto ADD_EXPLORER
if "%choice%"=="2" goto DEL_EXPLORER
if "%choice%"=="3" goto ADD_BT
if "%choice%"=="4" goto DEL_BT
if "%choice%"=="5" goto ADD_VBS_Shutdown
if "%choice%"=="6" goto REMOVE_VBS_Shutdown

if /I "%choice%"=="H" goto Help
if /I "%choice%"=="M" goto menu
if /I "%choice%"=="X" goto end
echo Invalid choice, try again.
pause
goto Desktop_menu

:ADD_EXPLORER

:: ВАШ РЯДОК ДЛЯ КИРИЛИЦІ (Windows-1251)
chcp 1251 >nul

:: ВИЗНАЧЕННЯ МОВИ
:: 1. Встановлюємо дефолтне значення
set "lang=EN"

:: 2. Отримуємо мову системи
for /f "tokens=3" %%a in ('reg query "HKCU\Control Panel\Desktop" /v PreferredUILanguages 2^>nul ^| findstr /i "PreferredUILanguages"') do set "sys_lang=%%a"

:: 3. Перевіряємо конкретні мови. Якщо збігів немає, змінна "lang" залишиться "EN"
echo %sys_lang% | findstr /i "uk-UA" >nul && set "lang=UA"
echo %sys_lang% | findstr /i "ru-RU" >nul && set "lang=RU"
echo %sys_lang% | findstr /i "be-BY" >nul && set "lang=BY"

:: 4. Присвоєння текстів на основі результату
if "%lang%"=="UA" (
    set "btn_exp=Перезапустити Провідник"
) else if "%lang%"=="RU" (
    set "btn_exp=Перезапустить Проводник"
) else if "%lang%"=="BY" (
    set "btn_exp=перазапусціць даследчык"
) else (
    :: Це спрацює для EN та будь-якої іншої мови (DE, FR, PL тощо)
    set "btn_exp=Restart Explorer"
)

:: Перезапуск Провідника
reg add "HKEY_CLASSES_ROOT\DesktopBackground\Shell\RestartExplorer" /ve /t REG_SZ /d "%btn_exp%" /f
reg add "HKEY_CLASSES_ROOT\DesktopBackground\Shell\RestartExplorer" /v "Icon" /t REG_SZ /d "SHELL32.dll,-259" /f >nul
reg add "HKEY_CLASSES_ROOT\DesktopBackground\Shell\RestartExplorer\command" /ve /t REG_SZ /d "cmd.exe /c taskkill /f /im explorer.exe && start explorer.exe" /f
echo.
echo [OK] Menu item "Restart Explorer" was added successfully.
echo Detected language = %sys_lang%
powershell -c (New-Object Media.SoundPlayer "%SystemRoot%\Media\tada.wav").PlaySync();
pause
goto Desktop_menu

:DEL_EXPLORER

reg delete "HKEY_CLASSES_ROOT\DesktopBackground\Shell\RestartExplorer" /f >nul 2>&1
echo [OK] Menu item "Restart Explorer" was removed successfully.
powershell -c (New-Object Media.SoundPlayer "%SystemRoot%\Media\tada.wav").PlaySync();
pause
goto Desktop_menu

:ADD_BT
:: ВАШ РЯДОК ДЛЯ КИРИЛИЦІ (Windows-1251)
chcp 1251 >nul

:: ВИЗНАЧЕННЯ МОВИ
:: 1. Встановлюємо дефолтне значення
set "lang=EN"

:: 2. Отримуємо мову системи
for /f "tokens=3" %%a in ('reg query "HKCU\Control Panel\Desktop" /v PreferredUILanguages 2^>nul ^| findstr /i "PreferredUILanguages"') do set "sys_lang=%%a"

:: 3. Перевіряємо конкретні мови. Якщо збігів немає, змінна "lang" залишиться "EN"
echo %sys_lang% | findstr /i "uk-UA" >nul && set "lang=UA"
echo %sys_lang% | findstr /i "ru-RU" >nul && set "lang=RU"
echo %sys_lang% | findstr /i "be-BY" >nul && set "lang=BY"


:: 4. Присвоєння текстів на основі результату
if "%lang%"=="UA" (
    set "btn_bt=Поділитися через Bluetooth"
) else if "%lang%"=="RU" (
    set "btn_bt=Поделиться через Bluetooth"
) else if "%lang%"=="BY" (
    set "btn_bt=Падзяліцца праз Bluetooth"
) else (
    :: Це спрацює для EN та будь-якої іншої мови (DE, FR, тощо)
    set "btn_bt=Share via Bluetooth"
)

:: Bluetooth
reg add "HKEY_CLASSES_ROOT\DesktopBackground\Shell\BluetoothShare" /ve /t REG_SZ /d "%btn_bt%" /f
reg add "HKEY_CLASSES_ROOT\DesktopBackground\Shell\BluetoothShare" /v "Icon" /t REG_SZ /d "fsquirt.exe" /f >nul
reg add "HKEY_CLASSES_ROOT\DesktopBackground\Shell\BluetoothShare\command" /ve /t REG_SZ /d "fsquirt.exe bthprops.cpl" /f
echo.
echo [OK] Menu item "Share via Bluetooth" was added successfully.
echo Detected language = %sys_lang%
powershell -c (New-Object Media.SoundPlayer "%SystemRoot%\Media\tada.wav").PlaySync();
pause
goto Desktop_menu

:DEL_BT

reg delete "HKEY_CLASSES_ROOT\DesktopBackground\Shell\BluetoothShare" /f >nul 2>&1
echo [OK] Menu item "Share via Bluetooth" was removed successfully.
powershell -c (New-Object Media.SoundPlayer "%SystemRoot%\Media\tada.wav").PlaySync();
pause
goto Desktop_menu

:ADD_VBS_Shutdown
:: ВАШ РЯДОК ДЛЯ КИРИЛИЦІ (Windows-1251)
chcp 1251 >nul

:: ВИЗНАЧЕННЯ МОВИ
:: 1. Встановлюємо дефолтне значення
set "lang=EN"

:: 2. Отримуємо мову системи
for /f "tokens=3" %%a in ('reg query "HKCU\Control Panel\Desktop" /v PreferredUILanguages 2^>nul ^| findstr /i "PreferredUILanguages"') do set "sys_lang=%%a"

:: 3. Перевіряємо конкретні мови. Якщо збігів немає, змінна "lang" залишиться "EN" ***
echo %sys_lang% | findstr /i "uk-UA" >nul && set "lang=UA"
echo %sys_lang% | findstr /i "ru-RU" >nul && set "lang=RU"
echo %sys_lang% | findstr /i "be-BY" >nul && set "lang=BY"

:: 4. Присвоєння текстів на основі результату ***
if "%lang%"=="UA" (
    set "btn_sd=Завершення роботи ПК 	ALT+F4"
) else if "%lang%"=="RU" (
    set "btn_sd=Завершение работы ПК 	ALT+F4"
) else if "%lang%"=="BY" (
    set "btn_sd=Завяршэнне працы ПК 	ALT+F4"
) else (

    :: Це спрацює для EN та будь-якої іншої мови (DE, FR, PL тощо)
    set "btn_sd=Shutdown 	ALT+F4"
)

:: 1. СТВОРЕННЯ VBS СКРИПТА В Windows
set "vbs_path=%SystemRoot%\shutdown_dialog.vbs"
echo Set objShell = CreateObject("Shell.Application") > "%vbs_path%"
echo objShell.ShutdownWindows >> "%vbs_path%"

:: 2. ДОДАВАННЯ ПУНКТІВ В РЕЄСТР З ІКОНКАМИ

:: Виклик вікна Alt+F4 (через VBS)
reg add "HKEY_CLASSES_ROOT\DesktopBackground\Shell\ShutdownVBS" /ve /t REG_SZ /d "%btn_sd%" /f
reg add "HKEY_CLASSES_ROOT\DesktopBackground\Shell\ShutdownVBS" /v "Icon" /t REG_SZ /d "shell32.dll,27" /f
reg add "HKCR\DesktopBackground\Shell\ShutdownVBS" /v Position /d "Bottom" /f
reg add "HKEY_CLASSES_ROOT\DesktopBackground\Shell\ShutdownVBS\command" /ve /t REG_SZ /d "wscript.exe \"%vbs_path%\"" /f

echo.
echo [OK] Menu item "Shutdown menu" was added successfully!
echo Detected language = %sys_lang%
powershell -c (New-Object Media.SoundPlayer "%SystemRoot%\Media\tada.wav").PlaySync();
pause
goto Desktop_menu

:REMOVE_VBS_Shutdown

reg delete "HKEY_CLASSES_ROOT\DesktopBackground\Shell\ShutdownVBS" /f >nul 2>&1

:: Видаляємо VBS файл, якщо він існуif exist "%SystemRoot%\shutdown_dialog.vbs" (
    del /f /q "%SystemRoot%\shutdown_dialog.vbs"
    echo [OK] Script file was removed in system folder successfully.
)
echo [OK] Menu item "Shutdown menu" was removed successfully.
powershell -c (New-Object Media.SoundPlayer "%SystemRoot%\Media\tada.wav").PlaySync();
pause
goto Desktop_menu

:Help
cls
color 0F
echo ====================================================
echo    HELP
echo ====================================================
echo.
echo - Press [Alt+ENTER] = Full screen mode ON \ OFF
echo - Press key [1-9] and press key [ENTER] = select a category.
echo - Insert number [1-20] and press key [ENTER] = launch the utility you need.
echo - Press key [M] = Main menu.
echo - Press key [H] = Help
echo - Press key [P] = Play sound (Sound existence test)
echo - Press key [X] = Exit.
echo.
echo - The driver backup destination flder is: "D:/MyDrivers".
echo - The GOD MODE destination flder is: "User Name Folder /Documents". You can delete it manually without any risk to damage your system.
echo - BE VERY CAREFULL USING DISKPART UTILITY. ALL YOUR DATA MAY BE LOST.
echo - BE VERY CAREFULL CHANGING REGISTRY KEYS. IT MAY DAMAGE YOUR SYSTEM OR MAKE IT UNSTABLE.
echo - Use utilities like: HDDScan or Victoria for a deep check your storage device.
echo - If your storage device has been damaged phisycally - use utilities like: Robocopy or Non Stop Copy for a copying your files. or Use dd_rescue utility to image your disk.
echo - Make sure your system is stable before deleting the update cashe! This action can not be undone and update rollback will be unavailable!
echo.
echo - DiskPart
echo - DiskPart can delete partitions and format disks.
echo - Be careful when choosing a disk number!
echo - All data on the selected disk may be lost.
echo 1. First use "List disks".
echo 2. Make sure you have selected the correct disk.
echo 3. Before formatting or clean, the utility will ask for confirmation.
echo 4. If you are not sure, it is better not to perform the action.
echo.
echo - Updates
echo - If you need to check latest updates use: DISM CONSOLE \ Show latest updates
pause
goto menu