#!/bin/bash

echo -e " \t\tIN this script you can check a file,\n\t it will be created if the it doesnot exists with your permission"
read -p "enter the file name" file
ls -l $file >> /dev/null
status=$?
test $status == 0 && echo "file exist" || echo "file doesnt exist"

if test $status != 0;
then
	echo -e "file doesn't exists"
	read -p "do you want to make the file type yes if you want to" decision
	if [ $decision == "yes" ]; then
		touch $file
		echo "file created"
	else
		echo "ok file not created"

	fi
fi

