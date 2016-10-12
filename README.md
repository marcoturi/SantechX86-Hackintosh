# SantechX86-Hackintosh
Repo for SantechX86 hackintosh. 

#Laptop Specs
Santech x86 
Mobo: Clevo N15/17RD 
CPU: i7-6700HQ + HM170 
RAM: 16 GB (8x2 DDR3-1600) 
Graphics: HD 530 + Geforce 960M 
Audio: ALC269 
Wifi: Intel Dual Band Wireless-AC 8260 
SSD: Samsung SSD 850 EVO 500GB (Mac Partition) + NVMe SAMSUNG MZVPV512 (Windows) 
Screen FHD 1920 x 1080
1xVGA 1xDP 1xHDMI

# App version
- Mac Os 10.11.6
- Clover v2.3k r3543

# Post-Instll
- Use the realtek 8111 2.2.1 from Multibeast -> Don't use rehab version as it doesn't work
- NVRAM is not implemented by default. Remember to add EmuVariableUefi-64.efi and install RC scripts on a customized clover installation to enable it.
- No need to patch DSDT for show power status
- Audio is working with mirone patch. Use DSDT patch + aDummyHDA.kext (ALC269VC v3)
- If after boot you notice that power status is not displaying + ethernet not working + instead of power off the system re-boot -> you need to power off the computer + boot without any phisic port used (USB, Ethernet, ecc.) -> I found that the solution to KP on boot is to always boot without any HW attached to the notebook.
- Remember that for 10.11.6 you CAN'T BOOT with HDMI or VGA plugged. You need to plug them after booting. See -> http://www.tonymacx86.com/threads/skylake-intel-hd-530-integrated-graphics-working-as-of-10-11-4.188891/page-23
- DSDT patch used:
	- GFX0 to IGPU
	- rename DSM to XDSM
        -if you have problems after this patch, try to search for other reference of _DSM in the file, and change them to XDSM
	- LAPIC for Skylake
	- Implementation of M_On and M_Off in dsdt
	- CPU power managment with pika's scripts
	- FIX IRQ
	- FIX HPET
	- HDEF patch (In reality it is HDES) patch for layout id 3
	- Shutdown 2
	- OS check FIX
	- System Mutex
	- ADP1 patch

#Info on monitors framebuffers
Internal Monitor framebuffer@0
DP (never worked, but i suppose framebuffer@1),
VGA framebuffer@2,
HDMI framebuffer@3

#USB
HS09@14900000: left usb3 #1
HS01@14100000: left usb3 #2
HS02@14200000: right usb3
SS03@15300000: back usb3

HS10@14a00000: BCM2070 (wifi/BT)
HS11@14b00000: BisonCam 
HS12@14c00000: EgisTec

HS00-HS14
SS01-SS10
USR1-2

#Sierra 12.0 - framebuffer
@0 (LVDS) 00 00 08 00 02 00 00 00 98 00 00 00
@1 (DP): 01 05 09 00 00 04 00 00 87 01 00 00
@2 (DP): 02 04 0A 00 00 04 00 00 87 01 00 00 
@3 (NA): FF 00 00 00 01 00 00 00 20 00 00 00

00 00 1B 19 00 00 00 00 64 99 07 00 00 00 00 00
01 03 03 03 00 00 20 02 00 00 50 01 00 00 00 60
6C 05 00 00 6C 05 00 00 00 00 00 00 00 00 00 00
00 00 08 00 02 00 00 00 98 00 00 00 01 05 09 00
00 04 00 00 87 01 00 00 02 04 0A 00 00 04 00 00
87 01 00 00 FF 00 00 00 01 00 00 00 20 00 00 00
0F 11 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
D0 69 1A 00 00 00 00 00 D0 6A 1A 00 00 00 00 00
20 6B 1A 00 00 00 00 00 01 00 00 00 08 00 00 00
01 00 00 00 00 00 00 00 00 00 3B 19 00 00 00 00
64 99 07 00 00 00 00 00 01 03 03 03 00 00 20 02
00 00 50 01 00 00 00 60 6C 05 00 00 6C 05 00 00
00 00 00 00 00 00 00 00 00 00 08 00 02 00 00 00
98 00 00 00 02 04 0A 00 00 08 00 00 87 01 00 00
03 06 0A 00 00 04 00 00 87 01 00 00 FF 00 00 00
01 00 00 00 20 00 00 00 87 11 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 D0 69 1A 00 00 00 00 00
D0 6A 1A 00 00 00 00 00 20 6B 1A 00 00 00 00 00
02 00 00 00 08 00 00 00 01 00 00 00 00 00 00 00
