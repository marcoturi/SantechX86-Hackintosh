DefinitionBlock ("SSDT-USB.aml", "SSDT", 1, "sample", "USBFix", 0x00003000)
{
    // "USBInjectAllConfiguration" : override settings for USBInjectAll.kext
    Device(UIAC)
    {
        Name(_HID, "UIA00000")
        // "RehabManConFiguration"
        Name(RMCF, Package()
        {
            // XHC overrides for 100-series boards
            "8086_a12f", Package()
            {
                "port-count", Buffer() { 0x15, 0, 0, 0}, // Highest port number is SS** at 0xNN
                "ports", Package()
                {   // TO COMPLETE THIS FILE, ADD ALL YOUR PORTS BELOW HERE, THEN SET port-count ABOVE
                    "HS01", Package() // USB2 device on USB3 port on the left #2
                    {
                        "UsbConnector", 3,
                        "port", Buffer() { 0x01, 0, 0, 0 },
                    },
                    "HS02", Package() // USB2 device on USB3 port on the right
                    {
                        "UsbConnector", 3,
                        "port", Buffer() { 0x02, 0, 0, 0 },
                    },
                    "HS03", Package() // USB2 device on USB3 port on the back
                    {
                        "UsbConnector", 3,
                        "port", Buffer() { 0x03, 0, 0, 0 },
                    },
                    "HS09", Package() // USB2 device on USB3 port on the left #1
                    {
                        "UsbConnector", 3,
                        "port", Buffer() { 0x09, 0, 0, 0 },
                    },
                    "HS10", Package() // BCM2070 (wifi/BT)
                    {
                        "UsbConnector", 255,
                        "port", Buffer() { 0x0a, 0, 0, 0 },
                    },
                    "HS11", Package() // BisonCam Webcam
                    {
                        "UsbConnector", 255,
                        "port", Buffer() { 0x0b, 0, 0, 0 },
                    },
                    //HS12 is fingerprint reader (disabled)                   
                    "SS01", Package() // USB3 device on USB3 port on the left #2
                    {
                        "UsbConnector", 3,
                        "port", Buffer() { 0x11, 0, 0, 0 },
                    },
                    "SS02", Package() // USB3 device on USB3 port on the right
                    {
                        "UsbConnector", 3,
                        "port", Buffer() { 0x12, 0, 0, 0 },
                    },
                    "SS03", Package() //  USB3 device on USB3 port on the back
                    {
                        "UsbConnector", 3,
                        "port", Buffer() { 0x13, 0, 0, 0 },
                    },
                    "SS05", Package() // USB3 device on USB3 port on the left #1
                    {
                        "UsbConnector", 3,
                        "port", Buffer() { 0x15, 0, 0, 0 },
                    },
                },
            },
        })
    }
}