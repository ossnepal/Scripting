#!/bin/bash
echo "this is a password checking script"
read -s -p "enter a password" pass
if [ $pass == 'redhat' ];
then 
	echo -e "\n password is correct"

else
	echo -e "\n password is incorrect"

fi
