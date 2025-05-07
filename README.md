# virsh-usb-switcher

libvirt/virsh usb switcher for use with a HDMI-switch connected to integrated graphics and to the dedicated GPU is passed to VM.

Continously checks for state change (is display attached or detached?) and attaches USB-Devices either to Host or VM, depending on display is connected or not (e.g. Display is connected: detach USB-Devices, Display is not connected: attach USB-Devices to VM), so USB Devices are switched to VM when display is switched via HDMI-switch (can be obtained for a few bucks from amazon or aliexpress) and back to host when display is switched to integrated graphics.



## Usage

Create USB devices from template.xml with devices ids from lsusb, if you have multiple Displays maybe update display_connected function with matching xrandr Line.

Put each devices created as xml in devices-Variable (without .xml suffix).

execute ./virsh-usb-switcher.sh VM-Name
