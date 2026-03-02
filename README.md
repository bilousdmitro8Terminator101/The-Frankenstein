### The Frankenstein v1.0.1 (2026\03\02)

Copyright by Dmytro Bilous (bilousdmitro8Terminator101)

## Security

The console was tested using [VirusTotal](https://www.virustotal.com/) to ensure that the program is clean and safe to use.

No malicious code or suspicious activity was detected during the scan.

## Description:

is a full-fledged console program written in the Windows command line language (Batch). It runs on top of the CMD kernel and provides the user with a set of system utilities and tools through its own menu. The program is designed for quick access to key Windows functions: diagnostics, cleaning, power management, launching system components, and system recovery.

## Utilities console:

Utilities Console Access to system utilities:
[1] = System version
[2] = About PC
[3] = Mobility Center (For laptop only)
[4] = Notepad
[5] = Explorer (My computer folder)
[6] = Windows Turning components ON / OFF
[7] = Windows servises
[8] = Audio devices
[9] = Sound mixer
[10] = Device manager
[11] = System recovery (Control panel)
[12] = System configuration
[13] = Regedit (CAUTION! - CHANGING REGISTRY VALUES MAY DAMAGE YOUR SYSTEM OR MAKE IT UNSTABLE)
[14] = Task manager
[15] = Power control classic
[16] = Time and date classic
[17] = System properties
[18] = Programs and components
[19] = Control folders
[20] = Malicious Software Removal Tool
[21] = Task Scheduler
[22] = WinUtil (Internet connection required to run)

## DISM Console:

[1] = Quick damage check
[2] = Deep scan of system files
[3] = Repairing damaged components
[4] = Enable .NET Framework 3.5 (From mount ISO \ DVD \ USB device)
[5] = Enable DirectPlay
[6] = Driver backup
[7] = Show latest updates

## Deep Cleaner:

[1] = Clear the update cache
[2] = Clear Temp files
[3] = Clean Manager
[4] = Delete folder "Windows.old" (WARNING! THIS ACTION CANNOT BE UNDONE AND SYSTEM ROLLBACK WILL BE UNAVAILABLE.)
[5] = Clean Microsoft Store cache
[6] = Clean DNS cache

## Shutdown Console:

[1] = Hibernate PC
[2] = Shutdown PC
[3] = Reboot PC
[4] = Special loading options mode
[5] = Find the BOOT MENU Key
[6] = Find the BIOS \ UEFI Key
[7] = Find the RECOVERY Key
[8] = Reboot to BIOS \ UEFI
[9] = Reboot to RECOVERY MODE

## Boot \ BIOS (UEFI) Menu \ Recovery mode:

Automatically determining the PC manufacturer
Displaying the correct keys to enter the Boot Menu  (ASUS, Dell, Lenovo, HP, Acer, Samsung, Toshiba, Sony Vaio, Fujitsu Siemens and others)
Displaying the correct keys to enter BIOS \ UEFI (ASUS, Dell, Lenovo, HP, Acer, Samsung, Toshiba, Sony Vaio, Fujitsu Siemens and others)
Display the correct keys to enter Recovery mode (ASUS, Dell, Lenovo, HP, Acer, Samsung, Toshiba, Sony Vaio, Fujitsu Siemens and others)
Check support for /fw to enter UEFI

## DISKPART:

Display full information about the selected disk or disk partition
Work with physical and virtual disks, cleaning, formatting, restoring the operability of damaged USB \ SD devises, and local or external HDD \ SSD disks (!!! CAUTION !!! USE IT VERY CAREFULL ALL YOUR DATA WILL BE DELETED)

## Robocopy — Robust File Copy for Windows

Robocopy - (Robust File Copy) — is a built-in Windows utility for reliable copying and synchronization of files and folders.
It is much more powerful than standard copying through Explorer and is suitable for working with large amounts of data.

### Key features

[1] = Simple folder copy
[2] = Mirroring (/MIR)
[3] = Copy only certain types of files
[4] = Copy with log to file

### Usage Examples

# Simple Copy
robocopy C:\Source D:\Backup

# Mirror Copy
robocopy C:\Source D:\Backup /MIR

# Copy with Log
robocopy C:\Source D:\Backup /LOG:C:\copy_log.txt

# Multi-threaded Copy
robocopy C:\Source D:\Backup /MT:8

### Sound testing
Test for sound existence (When you reinstall Windows OS you may not have sound, this feature helps to detect this problem)

### Additional Windows settings

[1] = Set Force terminating programs automatically in 5 sec (In case if not request)
[2] = Set Automatically reboot your PC (in case of BSOD)
[3] = Set Automatically restart Explorer (In case if not request)
[4] = Set Improving security (Shutdown will be longer)
[5] = Set Improving compatibility (For old programms and games)
[6] = Enable Default Photo viewer (As Windows 7)
[7] = Add \ remove items in Desktop context menu
[8] = Add \ remove GOD MODE folder (Extended control panel \ analog of classic control panel)
[9] = Disable avto Winlogon (In case if you have more than 1 local user account)
[10] = Hibernation ON \ OFF
[11] = Set High PC performance

## Features:

Color design for each block (main menu, utilities, DISM, cleaning, shutdown, Boot Menu).
Check administrator rights and automatic restart with elevated rights.
Logical menu structure with return to the main menu or exit.
Full compatibility with Windows 10/11.

## How to run:

Run it as administrator (The utillity will ofer you to run as administrator (accept it) or run it via shortcut or context menu).
Use the menu to select the desired action.

## Notes
Drivers are exported to D:\MyDrivers or any local drive you have (if D:\ drive is not exist)
the utility is safe for the system.
Some features (for example, Mobility Center) are only available on laptops.
Some features (for example, WinUtil) are requires Internet connection to run.
BE CAREFULL USING DISKPART ALL DATA MAY BE LOST)
