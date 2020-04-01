#!/usr/bin/bash

pactl list short sources
pactl list short sinks

pactl set-default-source alsa_output.pci-0000_09_00.6.analog-stereo.monitor
pactl set-default-sink  alsa_output.pci-0000_09_00.6.analog-stereo

pactl suspend-sink alsa_output.pci-0000_09_00.6.analog-stereo       false
pactl suspend-sink alsa_output.pci-0000_01_00.1.hdmi-stereo-extra3  true
