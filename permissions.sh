#!/bin/bash
echo -e "\t\t This is a script to automate permissions in file or folders. "
while true 
do	

	read -p "Enter a filename or directory " file
        ls -ld $file &> /dev/null
	if [ $(echo $?) == 0 ];
	then
		
		list=$(ls -ld $file | cut -c 1)
		if [ $(ls -ld $file | cut -c 1) == d ];
		then
			echo "This is a directory "
		 
		elif [ $(ls -ld $file | cut -c 1) == - ];
		then
			echo "This is a file "
		else
			echo "Cannot be modified its a special file"
			read "Ending script press enter to continue " e
			break
		fi
		if [ "i$list" == 'id'  ] || [ "i$list" == 'i-' ]; then
			clear 
			echo "1. change group of file/directory"
			echo "2. change owner of file/directory"
			echo "3. change permissions in file/directory"
			echo "4. ACL for specific user"
			read -p "Enter from the above choices" choices
			case $choices in
				1)
				echo "et nuhanging group of file/directory"
				read -p "enter the group that you want to add" grp
				chgrp $grp $file &> /dev/null
				if [ $(echo "$?") == 0 ]; 
				then
					read -p  "Done press enter to continue" e
				else 
					read -p "Group doesn't exist, Press enter to continue" e
					
				fi
				;;

				2)
				echo "change owner of file "
				read -p "enter the owner name" owner
				chown $owner $file &> /dev/null
				if [ $(echo "$?") == 0 ];
				then
					read -p "Done, Press enter to continue" e
				else
					read -p "Owner doesn't exist, Press Enter to continue" e
				fi
				;;

				3)
					echo "Changing the permission in the file "
					echo "Enter the field where you want to add the permissions" 
					u='y'
					g='y'
					o='y'
					if [ "i$u"=='iy' ] || [ "i$u" == 'iyes' ];then
						echo "Enter the permissions as per asked "
						echo "Enter y/yes for activating the permission"
					       	read -p "Do you want to add read permission to user  " re
						read -p "Do you want to add write permission to user " w
						read -p "Do you want to add the execute performance " e
						a=0
						b=0
						c=0
						if [ "i$re" == 'iyes' ] || [ "i$re" == 'iy' ];
						then
							a=4
						fi

						if [ "i$w" == 'iyes' ] || [ "i$w" == 'iy' ];
						then
							b=2
						fi	

						if [ "i$e" == 'iyes' ] || [ "i$e" == 'iy' ];
						then
							c=1
						fi	
						d=$(( a+b+c ))
					fi

					if [ "i$g"=='iy' ] || [ "i$g" == 'iyes' ];then
						echo "Enter the permissions as per asked "
						echo "Enter y/yes for activating the permission "
					       	read -p "Do you want to add read permission to group  " re
						read -p "Do you want to add write permission to group " w
						read -p "Do you want to add the execute permission to group " e
						a=0
						b=0
						c=0
						if [ "i$re" == "iyes" ] || [ "i$re" == "iy" ];
						then
							a=4
						fi
						if [ "i$w" == "iyes" ] || [ "i$w" == "iy" ];
						then
							b=2
						fi
						
						if [ "i$e" == "iyes" ] || [ "i$e" == "iy" ];
						then
							c=1
						fi
						ef=$(( a+b+c ))
					fi

					if [ "i$o"=='iy' ] || [ "i$o" == 'iyes' ];then
						echo "Enter the permissions as per asked "
						echo "Enter y/yes for activating the permission "
					       	read -p "Do you want to add read permission to others  " re
						read -p "Do you want to add write permission to others " w
						read -p "Do you want to add the execute permission to others " e
						a=0
						b=0
						c=0
						if [ "i$re" == "iyes" ] || [ "i$re" == "iy" ];
						then
							a=4
						fi
						if [ "i$w" == "iyes" ] || [ "i$w" == "iy" ];
						then
							b=2
						fi
						
						if [ "i$e" == "iyes" ] || [ "i$e" == "iy" ];
						then
							c=1
						fi
						f=$(( a+b+c ))
					fi
					echo "Permission to be given $d$ef$f "
					chmod $d$ef$f $file 2> /dev/null
				;;
				4)
					echo "Set ACL "
					read -p "do you want to give the acl for a group or user g/group for group u/user for user " select
					if [ "i$select" == 'iu' ] || [ "i$select" =='iuser' ];
					then	
						echo "Modifing ACL for a user" 
						read -p "enter the user " user
						cat /etc/passwd | grep -iw $user | awk -v var="$user" -F : '$1~var;' | awk -F : '{print $1}' &> /dev/null
						if [ $(echo $?) == 0 ];
						then
						       echo "valid user"	
						       read -p "Enter read permission " re
						       read -p "Enter write permission " w
						       read -p "Enter execute permission " e
						       ab=-
						       bc=-
						       de=-
						       if [ "i$re" == "iyes" ] || [ "i$re" == 'iy' ];
						       then
							       ab=r
						       fi
						       if [ "i$w" == "iyes" ] || [ "i$w" == 'iy' ];
						       then
							       bc=w
						       fi
						       if [ "i$e" == "iyes" ] || [ "i$e" == 'iy' ];
						       then
							       de=x
						       fi
						       setfacl -m u:$user:$ab$bc$de $file
					       	else
							echo "Invalid user"
						fi
					elif [ "i$select" == 'ig' ] || [ "i$select" =='igroup' ];
					then
						echo "Modifing ACL for a group" 
						read -p "enter the group " group
						cat /etc/group | grep -iw $group | awk -v var="$group" -F : '$1~var;' | awk -F : '{print $1}' &> /dev/null
						if [ $(echo $?) == 0 ];
						then
						       echo "valid user"	
						       read -p "Enter read permission y/yes for yes " re
						       read -p "Enter write permission y/yes for yes" w
						       read -p "Enter execute permission y/yes for yes " e
						       ab=-
						       bc=-
						       de=-
						       if [ "i$re" == "iyes" ] || [ "i$re" == 'iy' ];
						       then
							       ab=r
						       fi
						       if [ "i$w" == "iyes" ] || [ "i$w" == 'iy' ];
						       then
							       bc=w
						       fi
						       if [ "i$e" == "iyes" ] || [ "i$e" == 'iy' ];
						       then
							       de=x
						       fi
						       setfacl -m g:$group:$ab$bc$de $file
					       	else
							echo "Invalid Group"
						fi
					else
						echo "Inavalid option"
					fi
					;;
				*)
					echo "enter the range within the options"
				;;


			esac
		fi

	else
		echo "File doesn't exists. "
		break
	fi


done 

