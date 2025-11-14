#!/bin/bash
clear
echo -e "\t\t\e[34;4m Case statement for day printing. \e[0m"
while true
do

	echo "Choose your option among the following given"
	echo "0. Exit"
	echo "1. sunday"
	echo "2. Monday"
	echo "3. Tuesday"
	echo "4. Wednesday"
	echo "5. Thursday"
	echo "6. Friday"
	echo "7. Saturday"
	read cha
	case $cha in
		0)
			echo "hey so you choose to exit"
			clear
			break
		;;

		1)
			echo "hey so you choose sun"
		;;
		2)
			echo "hey so you choose mon"
		;;
		3)
			echo "hey so you choose tues"
		;;
		4)
			echo "hey so you choose wed"
		;;
		5)
			echo "hey so you choose thurs"
		;;
		6)
			echo "hey so you choose fri"
		;;
		7)
			echo "hey so you choose stauray"
		;;
	esac
done 
