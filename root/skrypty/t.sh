#!/bin/bash
#################################################
# Skrypt do wykonywania kopii zapasowych.       #
# Autor: < bercik1337@gmail.com >               #
#################################################

DZIEN="$(date '+%Y-%m-%d')"
LOGFILE=/var/log/backupy
CEL=/home/bercik/torrenty/swap/vm-backup/$DZIEN
mkdir -p /home/bercik/torrenty/swap/vm-backup/$DZIEN
mkdir -p $CEL/{var,home}
function backupuj
{
KATALOG=$1
if [ `df | awk {'print $3'} | sed -n 6p` -gt 500000 ]; then
      echo "$DZIEN - Duzo miejsca. Rozpoczynam tworzenie kopii $KATALOG" | tee >> $LOGFILE
	tar -czf $CEL/$KATALOG-$DZIEN.tar $KATALOG 2>> $LOGFILE
	if [ $? -eq 0 ]; then
	echo -ne "Ok \n" | tee >>  $LOGFILE
	else
	echo -ne "Co� posz�o nie tak \n" | tee >> $LOGFILE
	fi
else
   echo -ne "Ma�o miejsca \n" | tee >> $LOGFILE
fi
}
##########
case $1 in
"--help" | "-h")
echo -ne "Pomoc: \nProgram uruchamiamy podaj�c foldery �r�d�owe jako parametry. Poni�ej przyk�ady."
echo -ne "\n\n-h | --help) Wy�wietla ten tekst pomocy."
echo -ne "\n/etc) Wykona kopi� /etc."
echo -ne "\n/home/user) Wykona kopi� folderu domowego u�ytkownika user."
echo -ne "\n/var/log) Wykona kopi� podkatalogu log w katalogu /var."
echo -ne "\n\nUprawnienia superu�ytkownika konieczne s� w przypadku archiwizowania folder�w systemowych"
echo -ne "\nPrzyk�ady u�ycia:   ./program /etc /var/log /home/ja\n"
exit 0;;
esac

for x in `echo $*`
do
backupuj $x
done
exit 0
