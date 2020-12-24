#!/bin/bash
cd $(dirname $BASH_SOURCE)
echo "Starting rickrollAP at" `date` | tee -a rickrollap.log
# use the appropriate wifi interface
# also don't forget to put it in monitor mode before running the script
ifconfig wlan1 up 192.168.10.254 netmask 255.255.255.0
route add -net 192.168.10.0 netmask 255.255.255.0 gw 192.168.10.254
# assuming if nginx is disabled and not running at the moment
systemctl start nginx
dnsmasq -C ./dnsmasq.conf -d &>> rickrollap.log &
hostapd ./hostapd.conf &>> rickrollap.log &
echo "Started rickrollAP" | tee -a rickrollap.log
