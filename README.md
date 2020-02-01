# Misc Backup and Productivity Scripts
General Purpose bash scripts. Quite useful to automate backups.

## Script Details
### backup_mobile.sh
Very useful script to backup mobile data witlessly to local pc running Linux.
The script uses rsync and ssh connection to connect to mobile.
sshd demon can be run on android using apps.  I found Temux to be very powerful to run sshd on mobile.

```
sh backup_mobile.sh
```
Once SSHD is running on mobile you can create SSH password less connection using  ssh-keys. 
Once connection setup backup script can be configured to backup required folders.

Rsync command is quite advance and can be used for multiple reasons.
e.g. backup_mobile.sh script uses rsync to sync some folders between mobile and pc . (Both ways)

### backup_personal.sh & backup_system.sh
Both scripts can be used for bakup person or system folders to external hard drive.
The scripts mount my external hard drive if its not already mounted. 
This script relies on rsyncs archive functionality.

```
sh backup_personal.sh
sh backup_system.sh
```

### vboxscripts
These scripts can be used for starting & stopping multiple Oracle Virtual Boxes instances. 
This is good for quickly starting multiple instances without going through GUI>

```
sh startvms.sh
sh savevms.sh
```

Regards,
Himanshu Ahire
