#!/bin/bash 
#################################################
# Disaster recovery script                      #
# Author: < bercik1337@gmail.com >              #
#################################################

############### C O N F I G ###############
DATE="$(date '+%Y-%m-%d')"
STARTTIME="$(date '+%Y-%m-%d %H:%M:%S')"
LOGFILE=/var/log/backupy
TARGET=/home/bercik/torrenty/swap/dr

echo "#################################################" >> $LOGFILE
if [ `df /mnt/hgfs | awk {'print $4'} | sed -n 2p` -gt 20000000 ]; then
      echo "$STARTTIME - Duzo miejsca. Rozpoczynam tworzenie Disaster Recovery" | tee >> $LOGFILE
        echo "Rozpoczeto tworzenie DisasterRecovery. Potrwa to okolo 5min" | wall
	time dd if=/dev/sda of=$TARGET/hubble-sda-$DATE.img bs=1M 2>> $LOGFILE
        if [ $? -eq 0 ]; then
        echo -ne "Ok $(date '+%Y-%m-%d %H:%M:%S')\n" | tee >>  $LOGFILE
        else
        echo -ne "Coś poszło nie tak $(date '+%Y-%m-%d %H:%M:%S') \n" | tee >> $LOGFILE
        fi
else
   echo -ne "Mało miejsca \n" | tee >> $LOGFILE
fi
echo "$STARTTIME - Wyliczam sume kontrolna" | tee >> $LOGFILE
cd $TARGET
time rhash --percents --speed --sfv --output=hubble-sda-$DATE.img.sfv hubble-sda-$DATE.img >> $LOGFILE 
        if [ $? -eq 0 ]; then
	cat $TARGET/hubble-sda-$DATE.img.sfv >> $LOGFILE
        echo -ne "SFV - Ok $(date '+%Y-%m-%d %H:%M:%S')\n" | tee >>  $LOGFILE
        else
        echo -ne "SFV - Coś poszło nie tak $(date '+%Y-%m-%d %H:%M:%S') \n" | tee >> $LOGFILE
        fi
time rhash --percents --speed -M --output=hubble-sda-$DATE.img.md5 hubble-sda-$DATE.img >> $LOGFILE
        if [ $? -eq 0 ]; then
        cat $TARGET/hubble-sda-$DATE.img.md5 >> $LOGFILE
        echo -ne "SFV - Ok $(date '+%Y-%m-%d %H:%M:%S')\n" | tee >>  $LOGFILE
        else
        echo -ne "SFV - Coś poszło nie tak $(date '+%Y-%m-%d %H:%M:%S') \n" | tee >> $LOGFILE
        fi
echo "#################################################" >> $LOGFILE
exit 0


