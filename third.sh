#!/bin/bash 
echo "   *****practising the read command but with some advanced options*****   "
read -t 5 -p "name  " name 
read -t 6 -p " last name  " ln
read -t 10 -s -p "enter your secret key/password  " pass
echo -e "name is $name\n lastname is $ln \n secret is $pass  "

