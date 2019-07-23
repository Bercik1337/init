for x in `getlinks $1 | grep '.[jJpPgG][pPnNiI][gGfF]'`; do wget -nc $x; done
