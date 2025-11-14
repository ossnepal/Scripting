#!/bin/bash 
echo "*****  this is the first scripts  *****"
echo "here value a and b area given as environmental variables and hence we are going to get the vlaue of c"

c=`expr $a + $b`
echo "value of c chas been finalised as $c"

