#!/usr/bin/bash -x
#Authur : Himanshu 
#Date : 20-March-2020
#Simple script to run with Polybar. Can be used independently inside loop
#Execute given action if X session is idle for givent time. 
#This can be used as powersaving if login.config idle time not working if 
# xsession started on seperate VT


function exist (){
   for command in "$@"; do
     msg="$command is required to run script. Aborting"
     type "$command" &> /dev/null || { echo $msg >&2; exit 1; }
   done
}

function actions(){
    systemctl suspend-then-hibernate
    xdotool mousemove_relative 5 5
}

function status(){
    msgTime=$(($currentIdleMili/$oneMinute)) 
    [ $msgTime -gt 1 ] && echo "idle $msgTime minutes" || echo "active"
}

#Check Dependencies
exist xprintidle xdotool systemctl notify-send

#If wait time  not provided set default value 
[[ $1 = *[[:digit:]]* ]] && waitTime=$1 || waitTime=60

oneMinute=60000
#Convert to miliseconds
maxIdleMili=$(( $oneMinute * $waitTime  ))

sleep 10
#Get Idle time from xsession
currentIdleMili=$(xprintidle)
#If idle execute actions or report status
[ $currentIdleMili -gt $maxIdleMili ] && actions 

#Report Status
status

