#!/usr/bin/env sh
#Set wayland wallpaper
wall='/tmp/wallpaper.jpg'
read src
[ -f $src ] && cp -f $src $wall && sway output HDMI-A-1 mode 1920x1080 pos 1920 0 bg $wall fill
