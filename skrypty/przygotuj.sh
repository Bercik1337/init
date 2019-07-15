iptables -t nat -A POSTROUTING -o eth0 -s 192.168.250.0/24 -j MASQUERADE
iptables -A FORWARD -s 192.168.250.0/24 -j ACCEPT
iptables -A FORWARD -d 192.168.250.0/24 -j ACCEPT
echo 1 > /proc/sys/net/ipv4/ip_forward
echo 1 > /proc/sys/net/ipv4/conf/all/proxy_arp
#iptables -t nat -A PREROUTING -p tcp --dport 1337 -j DNAT --to 192.168.199.5:22
#iptables -t nat -A PREROUTING -p tcp --dport 227 -j DNAT --to 192.168.199.7:227

