#!/bin/bash
cd $(dirname $BASH_SOURCE)
echo "Stopping rickrollAP at" `date` | tee -a rickrollap.log
pkill hostapd
pkill dnsmasq
systemctl stop nginx
# use the appropriate wifi interface
ifconfig wlan1 down
route del -net 192.168.10.0 netmask 255.255.255.0 gw 192.168.10.254
echo "Stopped rickrollAP" | tee -a rickrollap.log
