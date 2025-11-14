#!/bin/bash 
clear
stat=no
echo -e "\t\tHello this is a script to automate patitioning"
read -p "Want to see the disk details press yes or y to view: " view
if [ "i$view" == 'iyes' ] || [ "i$view" == 'iy' ] || [ "i$view" == 'iye' ];
then
	lsblk | awk '!/NAME/'

else 
	echo "OK NExt step is there"
fi

read -p "Which disk do you want to edit: " disk 
lsblk | awk '!/NAME/' | awk '!/sr0/' | cut -d ' ' -f 1 > /tmp/file
for i in $(cat /tmp/file)
do 
	if [ "i$i" == "i$disk" ];
	then
		stat='yes'
		break
	fi

done
if [ $stat == 'yes' ];
then
	echo "disk exists"
	echo "listing its partition schema"
	fdisk -l "/dev/$disk" | grep -i $disk 
	num=$(fdisk -l "/dev/$disk" | grep -i $disk | wc -l )
	if [ $num -eq 1 ];
	then
		echo "No partition is there in the disk "
	fi
else
	echo "Doesn't exists "
fi


