#! /usr/bin/bash
#Written By Himanshu
#Needed Root Access
#Date 16/Jan/2019

DEVICE_NAME="My Passport"
LOG_FILE="/home/himanshu/work/logs/backup.log"

echo "System Backup started at " `date` |  tee -a $LOG_FILE

if [ ! -d "/run/media/himanshu/$DEVICE_NAME/backup/" ] ; then
	echo "Backup Device $DEVICE_NAME not found" | tee -a $LOG_FILE
	backup_drive=`lsblk -o path,label | awk "/$DEVICE_NAME/{ print $1 }"`
	echo "Divice Avilable, trying mount "$backup_drive  | tee -a $LOG_FILE 
	udisksctl mount -b $backup_drive | tee -a $LOG_FILE
	if [ ! -d "/run/media/himanshu/$DEVICE_NAME/backup/" ] ; then
		"Failed to Mount $backup_drive , backup aborted" | tee -a $LOG_FILE
		exit 1
	fi
fi

#Root System Backup
RSYNC='rsync -aAXP'

sudo $RSYNC --delete --exclude "/usr/share/man/*"   --exclude "/dev/*"  --exclude "/timeshift/*" --exclude "/.snapshots/*" --exclude "/proc/*" --exclude "/var/log/*" --exclude "/sys/*" --exclude "/tmp/*" --exclude "/run/*" --exclude "/mnt/*" --exclude "/media/*" --exclude "swapfile" --exclude "lost+found" --exclude ".cache" --exclude "Downloads" --exclude ".ecryptfs" --exclude "/home/*" --exclude "VirtualBoxVMs" / '/run/media/himanshu/My Passport/backup/arch_linux_system' | tee -a $LOG_FILE

echo "Backing Up System Files Completed at " `date` | tee -a $LOG_FILE


