#!/bin/bash 
read -p "enter a number to check even or odd" num
echo "number is $num"
n=`expr $num % 2`

if [ $num == 0 ];
then 
	echo "$num is zero"

elif [ $n == 0 ];
then 
	echo "number is even"

else
	echo "$num is odd"
fi

