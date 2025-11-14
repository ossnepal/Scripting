h=00110011
echo $h
b=01110100
abc=
echo $b
for i in {1..8}
do
	a=$(echo $h | cut -c $i )
	q=$(echo $b | cut -c $i )
	x=$(( a*q ))
	abc=$(echo $abc$x)
done
echo $abc
