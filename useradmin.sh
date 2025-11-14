#!/bin/bash
echo -e "\t\t\e[34;4m This is a script to automate user administration \e[0m"
while true
do	
	clear
	echo "1. Create user"
	echo "2. Joining users to a group"
	echo "3. Creating group"
	echo "4. Delete user"
	echo "5. Delete Group"
	echo "6. User administrative tasks "
	echo "7. exit"
	read -p "Enter your choice from the given: " choice
	case $choice in
		1)
		read -p "Name for the user to create? " create 
		useradd $create 2> /dev/null
		test $(echo $?) == 0  && echo "user created" && read -p "Press enter to continue" e || echo "Already exists" && read -p "Press enter to continue" e
		;;
		2)
		read -p "Enter the name of user to join him in a group. " user
		exist=$(cat /etc/passwd | grep -iw $user | awk -v val="$user" -F : '$1~val;' | awk -F : '{print $1}' )
		echo "$exist"	
		if [ "i$exist" == "i$user" ]; 
		then

			read -p "On which group to put the user. " group
			read -p "Make it primary group.(P) for primary any other for secondary. " g_type
			if [ g_type == 'p' ] || [ g_type == 'P' ];
			then
				usermod -g $group $user 2> /dev/null
				if [ $( echo $? ) == 0 ];
				then
				       echo "Done"
				       read -p "Press enter to continue" v       
			        else
				       echo "Group doesn't exist"
				       read -p "Press enter to continue" v       
				fi
			else
				usermod -aG $group $user 2> /dev/null
				if [ $(echo $?) == 0 ];
				then 
					echo " Done "
					read -p "Press Enter to continue " ent
				else
					echo "Group doesn't exists "
				fi
			fi

		else
			echo "User doesnt exists"
			read -p "Press Enter to continue" ent	

		fi
		;;

		3)
		echo "Creating Group"
		read -p "Enter the name of Group. " g_name
		g_check=$(cat /etc/group | grep -iw riyog | awk -F : -v val="$g_name" '$1~val;' | awk -F : '{print $1}')
		if [ "i$g_name" == "i$g_check" ];
		then
			echo "Group exists"
			read -s -p "Press enter key to continue" key
		else
			groupadd $g_name

			read -s -p "Press enter key to continue" key
		fi
		;;

		4)
		echo "Delete User"
		read -p "Enter the user that you want to delete All entries for" del
		exist=$(cat /etc/passwd | grep -iw $del | awk -v var="$del" -F : '$1~var;' | awk -F : '{print $1}')
		if [ "i$exist" == "i$del" ];
		then
			echo "Deleting user"
			userdel -r $del
			read -p "Press enter to continue" en
		else
			echo "User doesn't exists"
			read -p "Press enter to continue"
		fi
		;;

		5)
		echo "Delete Group"
		read -p "Enter the group that you want to Delete " gdel
		if [ "i$(cat /etc/group | grep -iw $gdel | awk -F : '{print $1}')" == "i$gdel" ];
		then
			groupdel $gdel 2> /dev/null
			test $(echo $?) == 0 && echo "Group deleted " || echo "Not deleted might be it is a primary group for a particular user"
		else
			echo "group doesnt exist"

		fi
		;;

		6)
		echo "User administrative task"
		
		clear
		read -p "Enter the user that you want to change the admin settings For: " name 
		if [ "i$(cat /etc/passwd | grep -iw $name | awk -F : -v var="$name" '$1~var;' | awk -F : '{print $1}')" == "i$name" ];

			
		then 
			while true
			do	
				clear 
				echo "Changing options for user: $name "
				if [ -z "$name" ];
				then 
					break
				fi
				read -p "Do you want to view his details " details
				if [ "i$details" == 'iyes' ] || [ "i$details" == 'iy' ];
				then
					chage -l $name 2> /tmp/file.txt

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
					read -p "Enter the number of days to change the password: " max
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

					*)
					echo "Plz enter options based on the suggestions "
					read -p "Press enter to continue" D
					sleep 2s
					clear 

				esac
			done	
		fi			
		;;
		7)
		echo "BYE BYE"
		break
		;;

		*)
		echo "Please give your answer as per mentioned in the options "

		esac
	done

