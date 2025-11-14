#!/bin/bash 
read -p "Give the mask" mask 
p=8
numbera=
numberb=
numberc=
numberd=

for i in {1..32}
do
	if [ $i -le $mask ];
	then
		add=1
	else
		add=0
	fi

	if [ $i -le 8 ];
	then
		numbera=$(echo "$numbera$add")
	fi
	
	if [ $i -gt 8 ]   && [ $i -le 16 ];
	then
		numberb=$(echo "$numberb$add")
	fi
	
	if [ $i -gt 16 ]   && [ $i -le 24 ];
	then
		numberc=$(echo "$numberc$add")
	fi
	
	if [ $i -gt 24 ]   && [ $i -le 32 ];
	then
		numberd=$(echo "$numberd$add")
	fi
	
done
echo "$numbera $numberb $numberc $numberd"
