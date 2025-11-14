#!/bin/bash
echo "This loop will go upto 15 iterations  "
i=1
while true 
do
	echo "Iteration is $i"
	i=`expr $i + 1`
	if [ $i == 15 ];
	then
		echo " last iteration"
		break
	fi

done 



