#!/bin/sh

tar="tar -cf"
gz="gzip"
bz="bzip2"
tarout="/tmp/bestcompress.$$.tar"
gzout="/tmp/bestcompress.$$.gz"
bzout="/tmp/bestcompress.$$.bz"
skipcompressed=1

if [ "$1" = "-a" ] ; then
skipcompressed=0 ; shift
fi

if [ $# -eq 0 ]; then
echo "Usage: $0 [-a] file or files to optimally compress" >&2; exit 1
fi
trap "/bin/rm -f $Zout $gzout $bzout" EXIT

for name
do
if [ ! -f "$name" ] ; then
echo "$0: file $name not found. Skipped." >&2
continue
fi

if [ "$(echo $name | egrep '(\.tar$|\.gz$|\.bz2$)')" != "" ] ; then
if [ $skipcompressed -eq 1 ] ; then
echo "Skipped file ${name}: it's already compressed."
continue
else
echo "Warning: Trying to double compress $name"
fi
fi

$tar $tarout "$name" &
$gz < "$name" > $gzout &
$bz < "$name" > $bzout &
wait
smallest="$(ls -l "$name" $tarout $gzout $bzout | \
awk '{print $5"="NR}' | sort -n | cut -d= -f2 | head -1)"

case "$smallest" in
1 ) echo "No space savings by compressing $name. Left as-is."
;;
2 ) echo "Best compression is with tar. File ranamed ${name}.tar"
mv $tarout "${name}.tar" ; rm -f "$name"
;;
3 ) echo "Best compression is with gzip. File renamed ${name}.gz"
mv $gzout "${name}.gz" ; rm -f "$name"
;;
4 ) echo "Best compression is with bzip2. File renamed ${name}.bz2$"
mv $bzout "${name}.bz2" ; rm -f "$name"
esac

done

exit 0
