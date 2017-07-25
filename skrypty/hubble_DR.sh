#!/bin/bash
function apollo {
DATABACKUP="$(date '+%Y-%m-%d')"
DATE="$(date '+%Y-%m-%d %H:%M:%S')"
LOGFILE=$HOME/skrypty/logi/hubble_DR.log
echo -ne "$DATE Rozpoczecie wysylania na apollo\n" >> $LOGFILE
scp -p  -i $HOME/.ssh/apollo $HOME/torrenty/swap/dr/hubble-sda-$DATABACKUP* bercik@bercik2.no-ip.org:/home/bercik/dr/ >> $LOGFILE 
        if [ $? -eq 0 ]; then
        echo -ne "$(date '+%Y-%m-%d %H:%M:%S') Ok\n" | tee >>  $LOGFILE
        else
        echo -ne "$(date '+%Y-%m-%d %H:%M:%S') Cos poszlo nie tak\n " | tee >> $LOGFILE
        fi
}
function pollux {
DATABACKUP="$(date '+%Y-%m-%d')"
DATE="$(date '+%Y-%m-%d %H:%M:%S')"
LOGFILE=$HOME/skrypty/logi/hubble_DR.log
echo -ne "$DATE Rozpoczecie wysylania na pollux\n" >> $LOGFILE
scp -p -P 222 -i $HOME/.ssh/pollux $HOME/torrenty/swap/dr/hubble-sda-$DATABACKUP* bercik@bercik2.no-ip.org:/home/bercik/Torrenty/dr/ >> $LOGFILE
        if [ $? -eq 0 ]; then
        echo -ne "$(date '+%Y-%m-%d %H:%M:%S') Ok\n" | tee >>  $LOGFILE
        else
        echo -ne "$(date '+%Y-%m-%d %H:%M:%S') Cos poszlo nie tak\n" | tee >> $LOGFILE
        fi
}
function malina {
DATABACKUP="$(date '+%Y-%m-%d')"
DATE="$(date '+%Y-%m-%d %H:%M:%S')"
LOGFILE=$HOME/skrypty/logi/hubble_DR.log
echo -ne "$DATE Rozpoczecie wysylania na malina\n" >> $LOGFILE
scp -p -P 22 -i $HOME/.ssh/malina $HOME/torrenty/swap/dr/hubble-sda-$DATABACKUP* bercik@192.168.1.9:/home/bercik/Torrenty/dr/ >> $LOGFILE
        if [ $? -eq 0 ]; then
        echo -ne "$(date '+%Y-%m-%d %H:%M:%S') Ok\n" | tee >>  $LOGFILE
        else
        echo -ne "$(date '+%Y-%m-%d %H:%M:%S') Cos poszlo nie tak\n" | tee >> $LOGFILE
        fi
}

$1
$2
$3
