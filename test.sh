#!/bin/bash 
read -p "enter name " a
exist=$(cat /etc/passwd | grep -iw $a | awk -v var="$a" '$1~var;' | awk -F : '{print $1}')
echo "$exist"
