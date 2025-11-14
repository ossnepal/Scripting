#!/bin/bash 
read -p "Enter the decimal number " f
z=10
for (( i=0; i<8; i++ ))
do
	s=$(( f%2 ))
	f=$(( f/2 ))
	z=$(( (z*10)+s ))
done 
echo $z | cut --complement -c 1-2 | rev


