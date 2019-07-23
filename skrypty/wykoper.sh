for x in `getlinks $1 | grep '.[jJpPgG][pPnNiI][gGfF]'`; do wget -q -P $2 -nc $x; done
