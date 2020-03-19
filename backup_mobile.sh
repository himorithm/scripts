#!/bin/bash
#Backup pcitures from Mobile Camera to PC Hard Disk
#Written by Himanshu
#Date 16/Jan/2020

MOBILE="u0_a416@192.168.1.3"
REMOTE_PATH="/data/data/com.termux/files/home/storage"
HOME_PATH="/home/himanshu/media"
LOG_FILE="/home/himanshu/work/logs/backup.log"
echo "Mobile Backup started at " `date` |  tee -a $LOG_FILE

echo  "Sync Local to Mobile started" |  tee -a $LOG_FILE
rsync -rtuv --exclude "*.out" --exclude "*.log" --exclude "*.gz" --exclude "*.aux" --exclude "*.toc" -e 'ssh -p 8022' --exclude ".git/" /home/himanshu/work/Documents/notes/latex/ $MOBILE:$REMOTE_PATH/notes/
echo  "Sync Local to Mobile Completed" |  tee -a $LOG_FILE

echo  "Sync Mobile to Local started" |  tee -a $LOG_FILE
rsync -rtuv --exclude "*.out" --exclude "*.log" --exclude "*.gz" --exclude "*.aux" --exclude "*.toc" -e 'ssh -p 8022' --exclude ".git/" $MOBILE:$REMOTE_PATH/notes/ /home/himanshu/work/Documents/notes/latex/
echo  "Sync Mobile to Local Completed" |  tee -a $LOG_FILE

echo "Music Backup started" |  tee -a $LOG_FILE
rsync -razzP -e 'ssh -p 8022' --exclude ".thumbnails/*" $MOBILE:$REMOTE_PATH/music/ $HOME_PATH/Music/
echo "Music Backup completed" |  tee -a $LOG_FILE

echo "Photos Backup started" |  tee -a $LOG_FILE
rsync -razzP -e 'ssh -p 8022' --exclude ".thumbnails/*" $MOBILE:$REMOTE_PATH/dcim/ $HOME_PATH/Pictures/mobile/
echo "Photos Backup Completed" |  tee -a $LOG_FILE

echo "Downloads Backup started" |  tee -a $LOG_FILE
rsync -razzP -e 'ssh -p 8022' --exclude ".thumbnails/*" $MOBILE:$REMOTE_PATH/downloads/ $HOME_PATH/Pictures/mobile_downloads
echo "Downloads Backup completed" |  tee -a $LOG_FILE

echo "Downloads CamScanner  started" |  tee -a $LOG_FILE
rsync -razzP -e 'ssh -p 8022' --exclude ".thumbnails/*" $MOBILE:$REMOTE_PATH/CamScanner/ /home/himanshu/work/Documents/CamScanner 
echo "Downloads CamScanner completed" |  tee -a $LOG_FILE

echo "BackingUp Mobile Files Completed at " `date` | tee -a $LOG_FILE




