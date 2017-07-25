#!/bin/bash
$DATA="$(date +%Y.%m.%d-%H_%M_%S)"
$dejt="$(date +%Y.%m.%d-%H_%M_%S)"
echo $DATA
echo $dejt
echo $DATA >> /home/bercik/.znc/moddata/adminlog/running.log
/usr/bin/znc | tee >> /home/bercik/.znc/moddata/adminlog/running.log 
if [ $? -eq 0 ]; then
  echo "$DATA Uruchomiono" | tee >> /home/bercik/.znc/moddata/adminlog/running.log
else
   echo "$DATA Running" | tee >> /home/bercik/.znc/moddata/adminlog/running.log
fi
