#!/bin/bash
clear
read -p "Enter the user that you want to change the admin settings For: " name 
if [ "i$(cat /etc/passwd | grep -iw $name | awk -F : -v var="$name" '$1~var;' | awk -F : '{print $1}')" == "i$name" ];

	
then 
	while true
	do
		read -p "do you want to view his details " details
		if [ $details == 'yes' ] || [ $details == 'y' ];
		then
			chage -l $name 
		fi
		echo " "
		echo " "
		echo " "
		echo "1. Expiry date"
		echo "2. Inactive date"
		echo "3. Warning days"
		echo "4. Maximum days between pass change "
		echo "5. minimum days between password change"
		echo "6. Detail of user "
		echo "7. Exit"
		read -p "Enter what you want to do: " choose
		case $choose in
			1)
			echo "Expiry date"
			read -p "Enter the expiry date YYYY/MM/DD" date 
			chage -E $date $name 2> /tmp/file.txt
			if [ $(echo $?) == 0 ];
			then
				read -p "Done, Press Enter to continue " ab
			else
				echo $(cat /tmp/file.txt | grep -iw invalid | awk -F : '{print $2}') | sed s/invalid/Invalid/
				read -p "Press Enter to continue" e
			fi
			;;
			2)
			echo "Inactive date"
			read -p "Enter the days number " days
			chage -I $days $name 2> /tmp/file.txt
			if [ $(echo $?) == 0 ];
			then
				read -p "Done, Press Enter to continue " ab
			else
				echo $(cat /tmp/file.txt | grep -iw invalid | awk -F : '{print $2}') | sed s/invalid/Invalid/
				read -p "Press Enter to continue" e
			fi
			;;

			3)
			echo "Warning days"
			read -p "Enter the number of days before warning: " warn 
			chage -W $warn $name 2> /tmp/file.txt

			if [ $(echo $?) == 0 ];
			then
				read -p "Done, Press Enter to continue " ab
			else
				echo $(cat /tmp/file.txt | grep -iw invalid | awk -F : '{print $2}') | sed s/invalid/Invalid/
				read -p "Press Enter to continue" e
			fi
			;;
			4)
			echo "Maximum number of days between pasword change "
			read "Enter the number of days to change the password:  " max
			chage -M $max $name 2> /tmp/file.txt

			if [ $(echo $?) == 0 ];
			then
				read -p "Done, Press Enter to continue " ab
			else
				echo $(cat /tmp/file.txt | grep -iw invalid | awk -F : '{print $2}') | sed s/invalid/Invalid/
				read -p "Press Enter to continue" e
			fi
			;;
			5)
			echo "Minimum number of days between password change: " 
			read -p "Enter the number of minimum days between password change: " min
			chage -m $min $name 

			if [ $(echo $?) == 0 ];
			then
				read -p "Done, Press Enter to continue " ab
			else
				echo $(cat /tmp/file.txt | grep -iw invalid | awk -F : '{print $2}') | sed s/invalid/Invalid/
				read -p "Press Enter to continue" e
			fi
			;;
			6)
			echo "user details to see"
			chage -l $name 
			;;
			7)
			echo "BYE BYE"
			break
			;;


		esac
	done
else
	echo "doesn't"
fi
