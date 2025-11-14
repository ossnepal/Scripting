#!/bin/bash
clear 
echo -e "\t\twelcome to the job  you will be qualified first with your are"
read -p "what is your age" age 

if [ "$age" -lt 17 ] || [ "$age" -gt 50 ];
then 
	echo "you are not qualified for the job"

elif [ "$age" -ge 17 ] && [ "$age" -lt 20 ];
then 
	echo "you are very young under 20 but you are qualified good luck"

elif [ "$age" -ge 20 ] && [ "$age" -lt 30 ];
then 
	echo "you are on your 20's you are qualified"

else
	echo "you are qualified"
fi
