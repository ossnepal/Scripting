#!/bin/bash
echo -e "\t\t\e[31;4m While Looooooop\e[0m"

while IFS=":" read -r f1 f2 f3 f4 f5 f6 f7
do 
	echo "field1: $f1"
	echo "field2: $f2"
	echo "field3: $f3"
	echo "field4: $f4"
	echo "field5: $f5"
	echo "field6: $f6"
	echo "field7: $f7"
	echo "=========================================================================================="
		
done < /etc/passwd
