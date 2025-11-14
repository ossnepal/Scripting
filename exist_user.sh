#!/bin/bash
clear
read -s  -p   "Enter the password: " pass; echo " "
echo "==============================================================================================="
done=no
for i in $( cat /root/scripts/password )
do
	if [ "i$pass" == "i$i" ];
	then
	       done=yes
	       echo "Password matched............"
	       break
       	fi
done


if [ "i$done" == "iyes" ];
then
		 read -p "enter the user that you want to search for : " user

	 echo "================================================================="

	 cat /etc/passwd | grep -iw $user > /dev/null
	 status=$?
	 if [ $status -eq 0 ]; then 
		echo "user exits"
		read -p "Do you want to get deatils for that user yes or y for yes: " decision  
		if [ "i$decision" == 'iyes' ] || [ "i$decision" == 'iy' ] || [ "i$decision" == 'iye' ];
		then
			clear
			echo -e "\t\t\e[31m Details for user $user \e[0m"
			name=$(cat /etc/passwd | grep -iw $user | awk -F : '{print $1}')
			user_id=$(cat /etc/passwd | grep -iw $user | awk -F : '{print $3}')
			group_id=$(cat /etc/passwd | grep -iw $user | awk -F : '{print $4}')
			directory=$(cat /etc/passwd | grep -iw $user | awk -F : '{print $6}')	
			shell=$(cat /etc/passwd | grep -iw $user | awk -F : '{print $7}')
			group=$(groups $user | awk -F : '{print $2}')
			echo "Name :    $name "
			sleep 1s
			echo "User_id:  $user_id"
			sleep 1s
			echo "Group_id: $group_id"
			sleep 1s
			echo "Home dir: $directory"
			sleep 1s
			echo "Shell_use: $shell"
			sleep 1s
			echo "User Groups: $group"
			echo ""
		else
			echo "ok details not shown"
		fi




	  else
		echo "no such user"
		read -p "do you want to create the user type yes or y to create : " use
		if [ "i$use" == 'iyes' ] || [ "i$use" == 'iy' ] || [ "i$use" == 'iye' ];
		then 
			useradd $user
			echo " user is addeed"
		else
			echo "okay user not added"
		fi
	  break
	  fi

else
	  echo "Password didn't matched, Sorry"

fi
  

