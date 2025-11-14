#!/bin/bash
clear
declare -i num
read -p  "Number of file you want to enter: " num
status=$?
for (( i=0; i<$num; i++ ))
do
	read -p "Enter file to read: " file
	echo "file = $file"

	check=$(ls -dl $file | cut -c 1-4)
	echo $check

	if [ $check == 'drwx' ];
	then 
		echo "there is a directory naming this"
		break
	fi

	clear 
	echo -e " \e[31m ${file} \e[0m "
	if test -f ${file};
	then
		echo "File exists. "
	else
		read -p "File doesn't exists do you want to create it y or yes to create" create
		if [ $create == 'yes' ] || [ $create == 'ye' ] || [ $create == 'y' ];
		then 

			echo "This is the file created by script. " > /tmp/tempfile.txt 
			cp /tmp/tempfile.txt $file 2> /dev/null
			if [ $(echo $?) != 0 ];
			then 
				echo "File not created this might be because an additional direcctory exists "

				read -p "Do you want to create the directories first yes y ye to create ?" dir
				if [ $dir == 'yes' ] || [ $dir == 'y' ];
				then
					echo -e "Ok creating file please wait.\n "
					total=$(echo ${file} | awk -F / '{print NF}')
					folder=$(echo ${file} | cut --complement -d / -f $total)
					mkdir -p $folder
					echo " Folder created"
					cp /tmp/tempfile.txt $file
					rm -rf /tmp/tempfile.txt
					echo "file created"
				else
					echo "ok not created "
					rm -rf /tmp/tempfile.txt
		
				fi
			else
				echo "File is created"
				rm -rf /tmp/tempfile.txt 2> /dev/null
		

			fi
		
		else
			echo "ok will not be created"
			rm -rf /tmp/tempfile.txt 2>/dev/null
				
		fi
	fi
done 
