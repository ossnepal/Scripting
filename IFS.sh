#!/bin/bash
read -p "enter the value you want to add in a variable" ifs
echo "if entered three value your values are being sepereated"
read -r val1 val2 val3 <<< $ifs 
#enter val4 val5....valn if more number fo variables are added 

echo  -e "$val1 \n $val2 \n $val3"
