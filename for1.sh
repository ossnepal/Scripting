#!/bin/bash
for i in $(cat /check_ssh)
do
	echo $i
	ssh $i;	cat /etc/os-release >> /root/scripts/info

done 
