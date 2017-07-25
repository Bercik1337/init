#!/bin/bash

# diskhogs, wysyla maila do userow ktorzy przekroczyli quote, wyswietla podsumowanie
maxdisk=20
violators="/tmp/diskkogs0.$$"
trap "/bin/rm -f $violators" 0

for name in $(cut -d: -f1,3 /etc/passwd | awk -F: '$2 > 99 { print $1 } ')
do
echo -n "$name"

find /home -user $name -type f -ls | \
awk '{ sum+= $7 } END {print sum / (1024*1024) }'

done | awk "\$2 > $maxdisk { print \$0 }" > $violators

if [ ! -s $violators ] ; then
echo "No users exceeded the disk quota of ${maxdisk}MB"
cat $violators
exit 0
fi

while read account usage ; do
cat << EOF | fmt | mail -s "Warning: $account Exceeded Quota" $account Your disk usage is $(usage)MB but you have only been allocated $(MAXDISKUSAGE)MB. This means that either you need to delete some of your files, compress your files or talk with us.

Thanks for your cooperation.
EOF

echo "Account $account has $usage MB of disk space. User notified."

done < $violators

exit 0