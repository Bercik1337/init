#!/bin/sh

# FQUOTA - Narzêdzie do analizy kwot dyskowych dla systemu Unix.
# Zak³ada sie, ¿e wszystkie konta u¿ytkownikow maj± uid >= 100

MAXDISKUSAGE=1

#for name in $(cut -d: -f1,3 /etc/passwd | awk -F: '$2 > 99 { print $1 }')
for name in $(ls /home)
do
#echo -n "User $name exceeds disk quota. Disk usage is: "
#find /home -user $name -type f -ls | \
#awk '{ sum += $7 } END { print sum / (1024*1024) " Mbytes" }'

#done | awk "\$9 > $MAXDISKUSAGE {print \$0 }"
#####
if [ "$name" = "bercik" ]; then
echo -ne ""
else
echo -n "User $name exceeds disk quota. Disk usage is: "
find /home -user $name -type f -ls | \
awk '{ sum += $7 } END { print sum / (1024*1024) " Mbytes" }'
fi
done | awk "\$9 > $MAXDISKUSAGE {print \$0 }"
#fi
#done
exit 0

