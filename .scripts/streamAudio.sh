#!/bin/bash

if [ "$1" == "-u" ]; then
  pactl unload-module module-loopback
  pactl unload-module module-null-sink

else
  pactl load-module module-null-sink sink_name=combined sink_properties=device.description="Combined"
  pactl load-module module-loopback source=alsa_input.usb-EVGA_EVGA_XR1_Lite_Capture_Box_Video_385203094059-02.analog-stereo sink=combined
  pactl load-module module-loopback source=alsa_input.pci-0000_00_1f.3.analog-stereo sink=combined
fi


pacmd set-default-source combined.monitor #Set it as default
