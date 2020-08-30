#!/usr/bin/sh 
#Created by Himanshu Ahire
# Connect Bluetooh Device using bluetoothctl 

bluetoothctl << EOF 
power on
agent on 
default-agent 
devices
connect 28:11:A5:ED:7E:6C
exit
EOF
