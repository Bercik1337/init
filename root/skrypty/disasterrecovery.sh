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
if [ `df | awk {'print $4'} | sed -n 6p` -gt 20000000 ]; then
      echo "$STARTTIME - Duzo miejsca. Rozpoczynam tworzenie Disaster Recovery" | tee >> $LOGFILE
        echo "Rozpoczeto tworzenie DisasterRecovery. Potrwa to okolo 30min" | wall
	time dd if=/dev/sda of=$TARGET/hubble-sda-$DATE.img bs=1M 2>> $LOGFILE
        if [ $? -eq 0 ]; then
        echo -ne "Ok $(date '+%Y-%m-%d %H:%M:%S')\n" | tee >>  $LOGFILE
        else
        echo -ne "Co¶ posz³o nie tak $(date '+%Y-%m-%d %H:%M:%S') \n" | tee >> $LOGFILE
        fi
else
   echo -ne "Ma³o miejsca \n" | tee >> $LOGFILE
fi
echo "$STARTTIME - Wyliczam sume kontrolna" | tee >> $LOGFILE
cd $TARGET
time cfv -C -t sfv -f hubble-sda-$DATE.sfv hubble-sda-$DATE.img | tee >> $LOGFILE
        if [ $? -eq 0 ]; then
	cat $TARGET/hubble-sda-$DATE.sfv >> $LOGFILE
        echo -ne "SFV - Ok $(date '+%Y-%m-%d %H:%M:%S')\n" | tee >>  $LOGFILE
        else
        echo -ne "SFV - Co¶ posz³o nie tak $(date '+%Y-%m-%d %H:%M:%S') \n" | tee >> $LOGFILE
        fi
time cfv -C -t md5 -f hubble-sda-$DATE.md5 hubble-sda-$DATE.img| tee >> $LOGFILE
        if [ $? -eq 0 ]; then
	cat $TARGET/hubble-sda-$DATE.md5 >> $LOGFILE
        echo -ne "MD5 - Ok $(date '+%Y-%m-%d %H:%M:%S')\n" | tee >>  $LOGFILE
        else
        echo -ne "MD5 - Co¶ posz³o nie tak $(date '+%Y-%m-%d %H:%M:%S') \n" | tee >> $LOGFILE
        fi
echo "#################################################" >> $LOGFILE
exit 0


