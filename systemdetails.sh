#!/bin/bash 
clear
echo -e "\t\tThis is a script to see the details of the system"
ping -c 1 -w 1 google.com &> /dev/null && int="connected" || int="Disconnected"
echo -e "\e[32mInternet: \t\e[0m\e[31m $int\e[0m"
sleep 1s
info=$(hostnamectl | awk  '/Operating System/' | awk -F : '{print $2}')
echo -e "\e[32mDistribution\e[0m: \t\e[31m$info\e[0m"
sleep 1s
info=$(dmidecode -s system-manufacturer)
echo -e "\e[32mOS_Vendor: \t\e[0m\e[31m$info"
sleep 1s
info=$(uname -m)
echo -e "\e[32mArchitecture: \t\e[31m$info\e[0m"
sleep 1s
info=$(uname -r)
echo -e "\e[32mKernel_version: \t\e[31m$info\e[0m"
sleep 1s
info=$(hostname)
echo -e "\e[32mHostname: \t\e[31m$info\e[0m"
sleep 1s
echo -e "\e[32mRam details: \t\n\e[31m$(free | grep -i mem)\e[0m"
sleep 1s
echo -e "\e[32mSwap details: \t\n\e[31m$(free | grep -i swap)\e[0m"
sleep 1s
echo ""
echo -e "\e[32mMemory details: \n\e[31m$(df -h)\e[0m"
echo ""
sleep 1s
echo -e "\e[32mLogged Users: \n\e[31m$(who)\e[0m"
echo ""
sleep 1s
echo -e "\e[32mInternal_IP: \t\e[31m$(hostname -I)\e[0m"
echo ""
sleep 1s
echo -e "\e[32mNameserver: \n\e[31m$(cat /etc/resolv.conf | awk '/nameserver/' | awk '{print $2}')\e[0m"
