rem A37-BLUnlocker by Andri-K@github or Andrz_@XDAForums
rem Based on BLUnlocker by naveensingh@github
rem TWRP included is an official build from TWRP site and maintained by Meghthedev@github or Meghthedev@XDAForums
@echo off
goto PREMENU
:PREMENU
title Oppo A37 Bootloader Unlocker
color 1f
set emmcdl="%~dp0bin\emmcdl.exe"
set firehose="%~dp0bin\firehose.mbn"
set twrp="%~dp0bin\twrp.img"
if not exist %emmcdl% goto NOTFOUND
if not exist %firehose% goto NOTFOUND
if not exist %twrp% goto NOTFOUND
goto DISCLAIMER
:NOTFOUND
cls
color 1f
echo Important file not found!
echo Exiting!
echo Press any key to exit...
pause > nul
goto QUIT
:DISCLAIMER
cls
color 1f
echo I AM NOT RESPONSIBLE IF YOUR PHONE GET BRICKED USING THIS TOOL.
echo USE THIS TOOL AT YOUR OWN RISK.
echo Press any key to use this tool...
pause > nul
goto MENU
:MENU
cls
color 1f
echo ========================================
echo               Unlocker Menu
echo ========================================
echo 1. Dump devinfo.img
echo 2. Flash devinfo.img
echo 3. Flash TWRP
echo 4. Dump boot.img
echo 5. Flash boot.img
echo 6. Quit Unlocker
rem echo 7. Command Promt
rem choice /c 1234567 /n /m "Choose what to do [1, 2, 3, 4, 5, 6, 7]:"
choice /c 123456 /n /m "Choose what to do [1, 2, 3, 4, 5, 6]:"
if %errorlevel% equ 1 goto DUMP_DEVINFO
if %errorlevel% equ 2 goto FLASH_DEVINFO
if %errorlevel% equ 3 goto FLASH_TWRP
if %errorlevel% equ 4 goto DUMP_BOOT
if %errorlevel% equ 5 goto FLASH_BOOT
if %errorlevel% equ 6 goto QUIT
rem if %errorlevel% equ 7 goto CMD
:DUMP_DEVINFO
cls
color 1f
echo ========================================
echo            Dump devinfo.img
echo ========================================
echo Please ensure your phone is in EDL mode.
set /p dump_port="Enter the port number that your phone is connected to (e.g COM1): "
echo Press any key to start the dumping process...
pause > nul
echo Dumping...
%emmcdl% -p %dump_port% -f %firehose% -d devinfo -o devinfo.img > nul
echo Done dumping!
echo Edit the dumped devinfo.img in Hex Editor (such as HxD) accordingly:
echo 1. Set offset 0x10 value to FF
echo 2. Set offset 0x18 value to FF
echo Press any key to return to Unlocker menu...
pause > nul
goto MENU
:FLASH_DEVINFO
cls
color 1f
echo ========================================
echo            Flash devinfo.img
echo ========================================
echo Please ensure that you have edited the devinfo.img file according to the previous instruction.
echo Please ensure your phone is in EDL mode.
set /p flash_devinfo_port="Enter the port number that your phone is connected to (e.g COM1): "
echo Press any key to start the Flashing process...
pause > nul
echo Flashing...
%emmcdl% -p %flash_devinfo_port% -f %firehose% -b devinfo devinfo.img > nul
echo Done flashing!
echo Now your phone bootloader has been unlocked!
echo Press any key to return to Unlocker menu...
pause > nul
goto MENU
:FLASH_TWRP
cls
color 1f
echo ========================================
echo                Flash TWRP
echo ========================================
echo Please ensure your phone is in EDL mode.
set /p flash_twrp_port="Enter the port number that your phone is connected to (e.g COM1): "
echo Press any key to start the Flashing process...
pause > nul
echo Flashing...
%emmcdl% -p %flash_twrp_port% -f %firehose% -b recovery %twrp% > nul
echo Done flashing!
echo Now your phone has TWRP!
echo Press any key to return to Unlocker menu...
pause > nul
goto MENU
:DUMP_BOOT
cls
color 1f
echo ========================================
echo              Dump boot.img
echo ========================================
echo Please ensure your phone is in EDL mode.
set /p dump_boot_port="Enter the port number that your phone is connected to (e.g COM1): "
echo Press any key to start the Dumping process...
pause > nul
echo Dumping...
%emmcdl% -p %dump_boot_port% -f %firehose% -d boot -o boot.img > nul
echo Done dumping!
echo Press any key to return to Unlocker menu...
pause > nul
goto MENU
:FLASH_BOOT
cls
color 1f
echo ========================================
echo              Flash boot.img
echo ========================================
echo Please ensure your phone is in EDL mode.
set /p flash_boot_port="Enter the port number that your phone is connected to (e.g COM1): "
set /p patched_boot_file="Enter the full path of the patched boot.img file (Path must not contain any spaces!): "
echo Press any key to start the Flashing process...
pause > nul
echo Flashing...
%emmcdl% -p %flash_boot_port% -f %firehose% -b boot %patched_boot_file% > nul
echo Done flashing!
echo Press any key to return to Unlocker menu...
pause > nul
goto MENU
rem :CMD
rem cls
rem color 1f
rem cmd
rem color 1f
rem goto MENU
:QUIT
cls
exit
