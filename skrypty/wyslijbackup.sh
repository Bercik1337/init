#!/bin/bash
#################################################
# Home directory backup script.                 #
# Author: < bercik1337@gmail.com >              #
#################################################

############### C O N F I G ###############
DATE="$(date '+%Y-%m-%d %H:%M:%S')"
LOGFILE=/var/log/sendbackup.log
USERNAME="$(whoami)"
echo "######## $DATE - Rozpoczynam wysylke backupow ########" >> $LOGFILE
cd /home/bercik/torrenty/swap/vm-backup
for i in $( ls ); do cp -rvu $i /home/bercik/platinum/serwer/ >> $LOGFILE; done
echo "######## $(date '+%Y-%m-%d %H:%M:%S') Zakonczono wysylke ########" >> $LOGFILE
