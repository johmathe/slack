#!/bin/bash

IPT=/sbin/iptables

$IPT -P INPUT DROP
$IPT -P OUTPUT ACCEPT
$IPT -P FORWARD ACCEPT

$IPT -A INPUT -m state --state RELATED,ESTABLISHED -j ACCEPT
$IPT -A INPUT -i lo -j ACCEPT
$IPT -A INPUT -p icmp -j ACCEPT

#Little hack : ntp for uk2

$IPT -A INPUT -p udp --dport 123 --source ntp2a.mcc.ac.uk -j ACCEPT

