awk {'print $2'} nieudane-* | uniq -c | sort > wynik.txt
