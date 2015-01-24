
/sbin/iptables -A INPUT -i eth1 -j ACCEPT

/sbin/iptables -A INPUT -p tcp --dport 80 --source  0.0.0.0/0 --destination  83.170.87.208 -j ACCEPT
/sbin/iptables -A OUTPUT -p tcp --dport 3306 --source 83.170.89.58 --destination 83.170.87.64 -j ACCEPT 
/sbin/iptables -A OUTPUT -p tcp --dport 3306 --source 83.170.89.58 --destination 83.170.89.150 -j ACCEPT 
/sbin/iptables -A INPUT -p tcp --dport 22 --source 0.0.0.0/0 --destination 83.170.89.58 -j ACCEPT 
/sbin/iptables -A INPUT -p tcp --dport 80 --source 0.0.0.0/0 --destination 83.170.89.58 -j ACCEPT 
/sbin/iptables -A INPUT -p udp --dport 123 --source 213.186.33.102 --destination 83.170.89.58 -j ACCEPT 
/sbin/iptables -A INPUT -p tcp --dport 4949 --source 213.251.181.139 --destination 83.170.89.58 -j ACCEPT 
/sbin/iptables -A INPUT -p udp --dport 123 --source 83.170.69.2 --destination 83.170.89.58 -j ACCEPT 
