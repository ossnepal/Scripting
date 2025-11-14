#!/bin/bash
for (( i=1; i<=12; i++ ))
do
	for (( j=1; j<=12; j++ ))
	do
		num=$(( $i + $j ))
		total=`expr $num % 2`
		if [ $total == 0 ];
		then
			echo -e -n "\e[40m  \e[0m"

		else
			echo -e -n "\e[47m  \e[0m"
		fi
	done
	echo ""
done
