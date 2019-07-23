#!/bin/bash 
#################################################
# Home directory backup script.                 #
# Author: < bercik1337@gmail.com >              #
#################################################

############### C O N F I G ###############
DATE="$(date '+%Y-%m-%d')"
LOGFILE=/var/log/backupy
#USERNAME="$(whoami)"
TARGET=/home/bercik/platinum/vm-backup/serwer/
#EXCLUDE=/home/bercik/skrypty/wykluczenia # OPTIONAL, unomment if needed.

if [ `df | awk {'print $3'} | sed -n 7p` -gt 500000 ]; then
      echo "$DATE - Duzo miejsca. Rozpoczynam tworzenie kopii $HOME" | tee >> $LOGFILE
        tar -l -X $EXCLUDE -czf $TARGET/$USERNAME-home-$DATE.tar $HOME 
2>> $LOGFILE
        if [ $? -eq 0 ]; then
        echo -ne "Ok \n" | tee >>  $LOGFILE
        else
        echo -ne "Co¶ posz³o nie tak \n" | tee >> $LOGFILE
        fi
else
   echo -ne "Ma³o miejsca \n" | tee >> $LOGFILE
fi

exit 0


