#!/usr/bin/sh 
#Created by Himanshu Ahire
# Connect Bluetooh Device using bluetoothctl 

bluetoothctl << EOF 
power on
agent on 
default-agent 
connect 90:7A:58:61:14:02 
exit
EOF
