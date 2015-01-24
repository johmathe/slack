/sbin/iptables -A OUTPUT -p tcp --dport 3306 --source 91.121.73.80 --destination 91.121.70.58 -j ACCEPT 
/sbin/iptables -A INPUT -p tcp --dport 22 --source 0.0.0.0/0 --destination 91.121.73.80 -j ACCEPT 
/sbin/iptables -A INPUT -p tcp --dport 80 --source 0.0.0.0/0 --destination 91.121.73.80 -j ACCEPT 
/sbin/iptables -A INPUT -p udp --dport 123 --source 213.186.33.102 --destination 91.121.73.80 -j ACCEPT 
/sbin/iptables -A INPUT -p tcp --dport 4949 --source 213.251.181.139 --destination 91.121.73.80 -j ACCEPT 
