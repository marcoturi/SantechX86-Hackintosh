# SantechX86-Hackintosh
Repo for SantechX86 hackintosh. In development.
- NVRAM is not implemented by default. Remember to add EmuVariableUefi-64.efi and install RC scripts on a customized clover installation to enable it.
- No need to patch DSDT for show power percentage
- Audio is working with mirone patch. Use DSDT patch + aDummyHDA.kext
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
Keyboard backlight, HDMI, 
To search:
search SMBUS 
kernel log about EHCI or UHCI -> USB
Wake reason

