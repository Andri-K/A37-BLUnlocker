# [A37-BLUnlocker](https://github.com/Andri-K/A37-BLUnlocker "A37-BLUnlocker")
## Prerequisites:
1. Qualcomm HS-USB QDLoader 9008 Driver: [Download Here](https://qdloader9008.com/ "Download Here")
## How to Use:
1. Clone or download the content of this repository.
2. Put your phone into EDL mode and connect your phone using USB cable.
3. Open A37-BLUnlocker.cmd file you just downloaded.
4. Dump your phone's devinfo.img.
5. Edit the dumped devinfo.img accordingly.
	1. Edit offset 0x10 value to FF,
	2. Edit offset 0x18 value to FF.
6. Flash the edited devinfo.img.
7. Now your phone's bootloader is unlocked!
8. (Optional) Flash TWRP to your phone.
## Putting your phone into EDL mode:
Note: When in EDL mode, your phone screen will not turn on.
1. Using ADB:
	1. Make sure your phone has USB debugging enabled.
	2. Connect your phone using USB cable.
	3. Open up Command Prompt.
	4. Type in `adb devices`, This should list your phone as a device, If it says unauthorized, make sure you gave permission to do USB debugging.
	5. Type in `adb reboot edl`, Now your phone should reboot and enter EDL mode!
2. Using Volume button:
	1. Turn off your phone.
	2. While pressing Vol Up (+) and Vol Down (-) button, Connect your phone using USB cable.
	3. Now your device will enter EDL mode!
	
## Credits:
1. [Naveen Singh](https://github.com/naveensingh "Naveen Singh's Github profile") - For creating [BLUnlocker](https://github.com/naveensingh/BLUnlocker "BLUnlocker"), which this project is based on.
2. [Meghthedev](https://github.com/Meghthedev "Meghthedev's Github profile") - For maintaining TWRP for Oppo A37.