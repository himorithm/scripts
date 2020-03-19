#! /usr/bin/bash
#Written by Himanshu
#Date 19/March/2020

echo "Backup started at " `date`
DEVICE_NAME="MyBook"
LOG_FILE="/home/himanshu/work/logs/mybook_backup.log"

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

RSYNC='rsync -aAXP'
#Backup Media
echo "Backing Up All Personal Files" | tee -a $LOG_FILE
$RSYNC --exclude ".Trash-1000" --exclude="lost+found" /home/himanshu/  "/run/media/himanshu/$DEVICE_NAME/backup/" &> $LOG_FILE
echo "Backing Up All Personal Files Completed" | tee -a $LOG_FILE
echo "Backup completed at " `date` | tee -a $LOG_FILE

