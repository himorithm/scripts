#! /usr/bin/bash
#Written by Himanshu
#Date 16/Jan/2020

echo "Backup started at " `date`

DEVICE_NAME="My Passport"
#DEVICE_NAME="Transcend"
LOG_FILE="/home/himanshu/work/logs/backup.log"

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
echo "Backing Up Media Files" | tee -a $LOG_FILE


$RSYNC --exclude "media/SteamLibrary/*"  --exclude "*.THM" --exclude "*.LRV" --exclude ".Trash-1000" --exclude="lost+found" /home/himanshu/media  "/run/media/himanshu/$DEVICE_NAME/backup/" | tee -a $LOG_FILE


echo "Backing Up Media Files Completed" | tee -a $LOG_FILE

# Work Actual Backup
echo "Backing Up Work Files" | tee -a $LOG_FILE


$RSYNC --exclude "work/timeshift/*"  --exclude "work/log/*" --exclude ".snapshots/" --exclude "*.iso" --exclude ".Trash-1000" --exclude="lost+found" /home/himanshu/work  "/run/media/himanshu/$DEVICE_NAME/backup/" | tee -a $LOG_FILE


echo "Backing Up Work files Completed" | tee -a $LOG_FILE



#Home Backup 
#Backup Special configuration files
echo "Backing Up personal Files" | tee -a $LOG_FILE


$RSYNC /home/himanshu/.config/  "/run/media/himanshu/$DEVICE_NAME/backup/himanshu_home/.config/" | tee -a $LOG_FILE

$RSYNC /home/himanshu/.Xresources  "/run/media/himanshu/$DEVICE_NAME/backup/himanshu_home/.Xresources" | tee -a $LOG_FILE

$RSYNC /home/himanshu/.xinitrc  "/run/media/himanshu/$DEVICE_NAME/backup/himanshu_home/.xinitrc" | tee -a $LOG_FILE

$RSYNC /home/himanshu/.bashrc  "/run/media/himanshu/$DEVICE_NAME/backup/himanshu_home/.bashrc" | tee -a $LOG_FILE

$RSYNC /home/himanshu/.gitconfig "/run/media/himanshu/$DEVICE_NAME/backup/himanshu_home/.gitconfig" | tee -a $LOG_FILE

$RSYNC /home/himanshu/.viminfo "/run/media/himanshu/$DEVICE_NAME/backup/himanshu_home/.viminfo" | tee -a $LOG_FILE


echo "Backing Up personal Files Completed" | tee -a $LOG_FILE

echo "Backup completed at " `date` | tee -a $LOG_FILE

