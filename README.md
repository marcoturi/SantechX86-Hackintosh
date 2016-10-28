# SantechX86-Hackintosh
Repo for SantechX86 hackintosh. This repo is not supposed to guide you through installation of the hackintosh, but to provide useful resources during it. To get started:

- [Botting the OS X installer on LAPTOPS with Clover] (https://www.tonymacx86.com/threads/guide-booting-the-os-x-installer-on-laptops-with-clover.148093/)
- [Santech X86 Thread on Tonymacx86.com (read all)] (https://www.tonymacx86.com/threads/santech-x86-skylake-problem-in-post-install.192690/)

#Laptop Specs
- Santech x86 
- Mobo: Clevo N15/17RD 
- CPU: i7-6700HQ + HM170 
- RAM: 16 GB (8x2 DDR3-1600) 
- Graphics: HD 530 + Geforce 960M 
- Audio: ALC269 
- Wifi: Intel Dual Band Wireless-AC 8260 
- SSD: Samsung SSD 850 EVO 500GB (Mac Partition) + NVMe SAMSUNG MZVPV512 (Windows) 
- Screen FHD 1920 x 1080
- 1xVGA 1xDP 1xHDMI

# Post-Instll
- Use the realtek 8111 2.2.1 from Multibeast -> Don't use rehab version as it doesn't work
- NVRAM is not implemented by default. Remember to add EmuVariableUefi-64.efi and install RC scripts on a customized clover installation to enable it.
- No need to patch DSDT for show power status
- Audio is working with mirone patch. Use DSDT patch + aDummyHDA.kext (ALC269VC v3)
- If after boot you notice that power status is not displaying + ethernet not working + instead of power off the system re-boot -> you need to power off the computer + boot without any phisic port used (USB, Ethernet, ecc.) -> Booting always without any HW attached decrease drastically this problem. Also the new USB patch probably fixed that problem.
- Remember that for 10.11.6 you CAN'T BOOT with HDMI or VGA plugged. You need to plug them after booting. See -> http://www.tonymacx86.com/threads/skylake-intel-hd-530-integrated-graphics-working-as-of-10-11-4.188891/page-23
- Disable the Airport extreme patch if using FAKEPCID
- Change locale (for airport patch) US = 55 53 IT = 49 54 -> 66C7065553EB2B -> 66C7064954EB2B
- DSDT patch used:
	- GFX0 to IGPU
	- rename DSM to XDSM
        - If you have problems after this patch, try to search for other reference of _DSM in the file, and change them to XDSM
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

#USB
- HS01@14100000: left usb3 #2 port <01 00 00 00>
- HS02@14200000: right usb3 port <02 00 00 00>
- HS09@14900000: left usb3 #1 port <09 00 00 00>
- HS10@14a00000: BCM2070 (wifi/BT) port <0a 00 00 00>
- HS11@14b00000: BisonCam port <0b 00 00 00>
- HS12@14c00000: EgisTec port <0c 00 00 00>
- SS03@15300000: back usb3 port <13 00 00 00>

Those port get actived aumatically using an usb hub
- HS03 port <03 00 00 00>
- SS01 port <11 00 00 00>
- SS05 port <15 00 00 00>
- SS02 port <12 00 00 00>

--------
- HS08 port <08 00 00 00>


#Info on monitors framebuffers
- Internal Monitor framebuffer@0
- DP (never worked, but i suppose framebuffer@1),
- VGA framebuffer@2,
- HDMI framebuffer@3

# Sierra
- I'ts not usable. Flickering on the top left of the screen, graphic glitch with programs.
- Sierra 12.0 - Graphic framebuffer
    - @0 (LVDS) 00 00 08 00 02 00 00 00 98 00 00 00
    - @1 (DP): 01 05 09 00 00 04 00 00 87 01 00 00
    - @2 (DP): 02 04 0A 00 00 04 00 00 87 01 00 00 
    - @3 (NA): FF 00 00 00 01 00 00 00 20 00 00 00
