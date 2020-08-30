#!/bin/sh
CONNAME=$(nmcli -t -f active,ssid dev wifi | grep '^yes' | cut -c 5-)
PRIVATE=$(nmcli -a | grep 'inet4 192' | awk '{print $2}')
printf "🌐 %s %s" "$CONNAME" "$PRIVATE" 
