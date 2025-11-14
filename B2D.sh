#!/bin/bash
a='11000000 10101000 00001000 00001000'
net_address=''
for (( i=1; i<5; i++ ))
do
	block=$(echo "$a" | awk -F ' ' -v var="$i" '{print $var}')
	value=128
	nu=1
	block_d=0
	for(( j=1; j<9; j++ ))
	do
		c=$(echo $block | cut -c $j)
		if [ $c == 1 ];
		then
			if [ $j == $nu ];
			then
				block_d=$(( block_d+value ))
				value=$(( value/2 ))
				nu=$(( nu+1 ))
			fi	
		else	
			echo -n ""
			nu=$(( nu+1 ))
			value=$(( value/2 ))
		fi


	done
	if  [ $i == 1 ];
	then
		net_address=$(echo "$net_address$block_d" )
	else
		net_address=$(echo "$net_address.$block_d")
	fi
done
echo $net_address
