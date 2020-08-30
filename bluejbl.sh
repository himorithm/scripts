#!/usr/bin/sh 
#Created by Himanshu Ahire
# Connect Bluetooh Device using bluetoothctl 

bluetoothctl << EOF 
power on
agent on 
default-agent 
scan on
devices
connect 78:44:05:77:3E:E0
exit
EOF
