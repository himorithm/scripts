#!/usr/bin/bash

pactl list short sinks
pactl set-default-sink  alsa_output.pci-0000_09_00.6.analog-stereo
