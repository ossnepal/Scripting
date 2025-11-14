#!/bin/bash
read -p "Enter the number of hosts that you want to enter " h_numm
for (( rai=0; rai<$h_numm; rai++))
do
	read -p "Number of hosts in a 1st network" host_numm[$rai]
done
for ((i=0; i<h_numm; i++))
do
	echo  "${host_numm[$i]}"
done
echo "====================================================================================="
# Arranging host in asscending order
for (( ck=0; ck<$h_numm; ck++ ))
do
	for (( gk=$ck; gk<h_numm; gk++ ))
	do
		if [ ${host_numm[$ck]} > ${host_numm[$gk]} ];
		then
			temp=${host_numm[$gk]}
			host_numm[$gk]=${host_numm[$ck]}
			host_numm[$ck]=$temp
		fi
	done
done
for ((i=0; i<h_numm; i++))
do
	echo  "${host_numm[$i]}"
done

