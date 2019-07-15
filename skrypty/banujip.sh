iptables -N from-list
iptables -I INPUT -s 0.0.0.0/0 -j from-list
for IP in $(cat toban.txt); do iptables -I from-list -s $IP/32 -d 0/0 -j DROP; done
#iptables -L
#iptables -S
#iptables -F from-list
#iptables -X from-list
