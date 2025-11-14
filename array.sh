read -p "enter a number for array" c
for (( i=0; i<9; i++ ))
do
	read -p "Enter $i number " host[$i]
done
for (( i=0; i<9; i++ ))
do
	echo ${host[$i]}
done
