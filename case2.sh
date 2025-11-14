#!/bin/bash
clear
declare -i a
declare -i b
while true
do 

	read  -p "Give the first numbers " a
	read -p "Give second number " b
	echo "0. Quit"
	echo "1. Add two numbers"
	echo "2. Substract two numbers"
	echo "3. Multiply two numbers "

	read -p "Enter your choice: " choice
	case $choice in
	0)
		clear
		break

	;;

	1)
		c=$(( a + b ))
		echo "Addition is $c"
	;;

	2)
		if test  $a -lt $b ;
		then 
			echo " Substractor is smaller than substahend"
		else
			c=`expr $a - $b`
			echo "Substraction is $c"
		fi
	;;
	
	3)
		c=$(( a * b ))
		echo "Multiplication is $c "
	;;
	esac
done 
		







