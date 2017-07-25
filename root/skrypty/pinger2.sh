#!/bin/bash
ping -c 1 -t 1 192.168.0.2
if [ $? -eq 0 ]; then 
  if [ "`mount|grep pobrane`" == "//192.168.0.2/D/Pobrane on /home/bercik/pobrane type cifs (rw,mand)" ]; then 
    echo "Katalog zamontowany"
  else
       mount -t cifs //192.168.0.2/D/Pobrane /home/bercik/pobrane -o rw,password=guest
  fi
else
   echo "Odmontowywuje pobrane"; umount /home/bercik/pobrane
fi
