#!/bin/bash
case $1 in
"--help" | "-h") 
echo Program uruchamiamy bez �adnych parametr�w. Najlepiej jako root.
exit 0;;
esac
###################################################
# B E Z   N A Z W Y (jeszcze pracuje nad tym) :D  #
# Dzia�anie: sprawdza czy w systemie s�		  #
# zainstalowane moje ulubione programy, wypisuje  #
# brakuj�ce i obecne. Potem sprawdza uprawnienia, #
# w�a�ciciela i grupe kilku wa�nych  katalog�w    #
# systemowych i na ko�cu w razie potrzeby je      #
# zmienia           				  #
#		    contact: bercik1337@gmail.com #
###################################################


############## Deklaracje kolor�w ## ########
red="\033[31;40m"			    
blue="\033[34;40m"
yellow="\033[33;40m"
white="\033[37;40m"
green="\033[32;40m"
#############################################

echo -ne  > /$HOME/braki.txt
echo "Sprawdzam obecno�� programu:"
for x in irssi ekg ekg2 ncftp mc c3270 htop saidar screen lynx sshfs dialog fail2ban gcc znc mutt motd utworzpublihtml dziennik unzip vim mtr 
do
echo -ne $white "$x ..... "
which $x 1> /dev/null
if [ $? = 0 ]; then
	echo -e $white "Ok"
  else
echo -n " $x" >> /$HOME/braki.txt
echo -e $red "Brak"	
  fi
done
echo -e $white "Brakuj�ce programy to:"
cat  /$HOME/braki.txt
echo -e "\v \r Lista zapisana do pliku braki.txt w Twoim katalogu domowym"
echo -ne "\n##########################################################################"
echo -ne "\nTeraz nast�pi sprawdzanie uprawnie� folder�w"
function uprawnienia
{
echo -ne $green "\nSprawdzam katalog $1"
echo -ne $white "\n Wla�ciciel"
if [ "`ls -l / | grep $1 | head -n 1 | awk '{print $3}'`" == "root" ]; then
echo -e " Ok"
else
echo -e $red " !Z�y w�a�ciciel!"
fi
echo -ne $white "Grupa"
if [ "`ls -l / | grep $1 | head -n 1 | awk '{print $4}'`" == "root" ]; then
echo -e " Ok"
else
echo -e $red " !Z�a grupa!"
fi
echo -ne $white "Uprawnienia"
if [ "`ls -l / | grep $1 | head -n 1 |  awk '{print $1}'`" == "drwx------" ]; then
echo -e " Ok"
else
echo -e $red " !Z�e uprawnienia!"
echo $1 >> katalogi.txt
fi
}
uprawnienia mnt
uprawnienia boot
uprawnienia dev
echo -ne $white "\n\n###################################################"
echo -ne $white "\nCzy chcesz zmieni� uprawnienia folder�w na 700[drwx------]? (MUSISZ BY� ROOTEM)"
while true; do  # infinite loop
    echo -ne "\n t/N/? \n"
echo -ne "\n Wpisz 'q' aby wyj�� \n"
    read -n1 -p "Co wybieramy?" answer
    case $answer in
        "T"|"t") 
echo -ne "\nFolder wymagaj�ce zmiany:\n"
cat test.txt
for k in $(cat katalogi.txt)
do
echo -ne "\nAktualny folder - $k\n"
echo -ne "Trwa zmiana... "
chmod 700 $k
echo -ne "Zrobione\n"
done
;;
        2) echo -ne "Moving on..\n";;
        q) break ;;         # Break out of the loop
	"?") echo -ne $yellow "\n\nOperacja ta zmieni uprwanienia dost�pu do folderu poleceniem chmod. W wyniku tego 
do folderu uzyska dost�p tylko root. Je�li nie wiesz co wybra�, wybierz "q" aby wyj��.\n" $white;;
        *) echo -ne "\nSay what?\n" ;;
    esac
done
