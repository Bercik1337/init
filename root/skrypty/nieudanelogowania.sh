#!/bin/bash
DATA=`date +%Y.%m.%d`
awk '/sshd/ && /Failed/ {gsub(/invalid user/,""); printf "%-12s %-16s %s-%s-%s\n", $9, $11, $1, $2, $3}' /var/log/auth.log > /root/nieudane-$DATA.txt
echo -ne > /var/log/auth.log
