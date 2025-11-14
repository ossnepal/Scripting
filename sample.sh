#!/bin/bash 
read -p "enter the character" a
read -p "enter " b
if [ $a == $b ];
then
	echo "successful"
else
	echo "failed"
fi	
