# virsh-usb-switcher

libvirt/virsh usb switcher for use with HDMI-switch in conjunction with GPU Passthrough

Continously checks for state change (is display attached or detached?) and attaches USB-Devices either to Host or VM, depending on display is connected or not (e.g. Display is connected: detach USB-Devices, Display is not connected: attach USB-Devices to Domain

## Usage

Create USB devices from template.xml with devices ids, if you have multiple Displays maybe update display_connected function with matching xrandr Line.

Put each devices created as xml in devices-Variable (without .xml suffix).

execute ./virsh-usb-switcher <domain name>
