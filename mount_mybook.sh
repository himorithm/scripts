#!/bin/sh

diskName="MyBook"
mountpath="/run/media/himanshu/$diskName"
[ -d "$mountpath" ] &&  exit 0

diskpath=$(lsblk -o path,label | awk "/$diskName/ {print $1}")
[ -n "$diskpath" ] && udisksctl mount -b $diskpath
