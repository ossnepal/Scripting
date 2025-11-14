for ((i=0; i<9; i++))
do
	read -p "Enter $i" h[$i]
done
for (( i=1; i<10; i++ ))
do
	echo ${h[$(( i-1 ))]}
done
