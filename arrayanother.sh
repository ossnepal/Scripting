#!/bin/bash
for i in {1..2}
do
	read -p "REad host " host_numm[$i]
done
for loom in {2..3}
do

	echo "${host_numm[$(( loom-1 ))]}"
done
