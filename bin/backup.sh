#!/bin/bash

BACKUPDIRS='/etc /home/dyuri'
TARGET='backup@almanas:/volume1/NetBackup'
TARGETDIR=`hostname`'-backup/'
LOGFILE="/var/log/backup.log"

echo "Backup started" > ${LOGFILE}

for bd in ${BACKUPDIRS}; do
  rsync -avxH -e "ssh -i $HOME/.ssh/backup" --exclude '.thumbnails' $bd ${TARGET}/${TARGETDIR} >> ${LOGFILE} 2>&1
done
