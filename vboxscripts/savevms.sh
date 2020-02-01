#!/bin/bash
running=$(VBoxManage  list runningvms | awk '{print $1}')

for current in $running
do 
	command=$(echo $current | tr -d '"')
	echo $command Saving State 
	VBoxManage controlvm $command savestate
done

VBoxManage  list runningvms
