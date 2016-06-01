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
- Mac Os 10.11.5
- Clover v2.3k r3543
- Multibeast 8.2.2

# Post-Instll
- Use the realtek 8111 2.2.1 from Multibeast -> Don't use rehab version as it doesn't work
- Use multibeast "Increase Max Port Limit" and "3rd Party USB 3.0 patch".
- NVRAM is not implemented by default. Remember to add EmuVariableUefi-64.efi and install RC scripts on a customized clover installation to enable it.
- No need to patch DSDT for show power status
- Audio is working with mirone patch. Use DSDT patch + aDummyHDA.kext (ALC269VC v3)
- If after boot you notice that power status is not displaying + ethernet not working + instead of power off the system re-boot -> you need to power off the computer + boot without any phisic port used (USB, Ethernet, ecc.)
- Remember that for 10.11.5 you CAN'T BOOT with HDMI or VGA plugged. You need to plug them after booting. See -> http://www.tonymacx86.com/threads/skylake-intel-hd-530-integrated-graphics-working-as-of-10-11-4.188891/page-23
- DSDT patch used:
	- GFX0 to IGPU
	- rename DSM to XDSM
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


Issue:
Keyboard backlight
