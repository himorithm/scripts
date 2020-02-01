#!/bin/bash

running=$(VBoxManage  list runningvms | awk '{print $1}')
all=$(VBoxManage  list vms | awk '{print $1}')


for current in $all
do 
	echo $current DDDDDD
	echo Running DDDDD $running
	command=$(echo $current | tr -d '"')
	if [[ "$running" =~ "$current" ]];
	then
		echo $command is Already Running
		continue
	else
		echo $command not running. Starting up
		VBoxManage startvm $command
	fi
done

VBoxManage  list vms 
