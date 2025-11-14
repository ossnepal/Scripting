clear
clear
echo -e "\t\t\e[32m Hello this is a script for subnetting\e[0m "
while true
do
	read  -p "Enter the ip for subnet dont put subnet mask " sub
	sub=$(echo $sub | cut -d '/' --complement -f 2 )
	tot=$(echo "$sub" | awk -F '.' '{print NF}')
	if [ $tot -gt 4 ] || [ $tot -lt 4 ];
	then
	       read -p "Invalid IP press enter to continue" e
	       break
        elif [ $tot -eq 4 ];
        then
		for (( i=1; i<5; i++ ))
		do
			j=$(echo $sub | awk -v var="$i" -F '.' '{print $var}')
			test "i$j" == 'i' && echo "$i is empty quiting the program" && break || echo -n ""       	             
			if [ $j -gt 255 ]
			then
				echo "Block $i is invalid"
				read -p "press enter  to continue" e
				break
			else	
				if [ $i == 4 ];
				then	
					read -p "What is the current subnet mask for this cant be less than 8 " mask
					if [ $mask -lt 8 ];
					then
						read -p " Mask cant be less than 8 in case " c
						break
					elif [ $mask == 32 ];
					then
						read -p "Mask of 32 makes no sense" c
						break

					fi
					echo  "As per given details $sub/$mask"
					for (( i=1; i<5; i++ ))
					do	
						number=$(echo $sub | awk -F '.' -v var=$i '{print $var}' )
						z=10

						for ((j=1; j<9; j++))
						do
							x=$(( number%2 ))
							number=$(( number/2 ))
							z=$(( (z*10)+x ))

						done
						if [ $i == 1 ];
						then
							numbera=$z
							numa=$(echo "${numbera}" | cut -c 1-2 --complement | rev) 
						elif [ $i == 2 ];
						then
							numberb=$z
							numb=$(echo "${numberb}" | cut -c 1-2 --complement | rev) 
						elif [ $i == 3 ];
						then 
							numberc=$z
							numc=$(echo "${numberc}" | cut -c 1-2 --complement | rev) 
						else
							numberd=$z
							numd=$(echo "${numberd}" | cut -c 1-2 --complement | rev) 
						fi
						ip_bin=$(echo "$numa$numb$numc$numd")

					done


					if [ $mask -gt 32 ] || [ $mask -lt 1 ];
					then 
						echo "Invalid mask"
						read -p "Press enter to break " e
						break
					else	
						
						p=8
						numba=
						numbb=
						numbc=
						numbd=

						for ab in {1..32}
						do
							if [ $ab -le $mask ];
							then
								add=1
							else
								add=0
							fi

							if [ $ab -le 8 ];
							then
								numba=$(echo "$numba$add")
							fi
					

							if [ $ab -gt 8 ]   && [ $ab -le 16 ];
							then
								numbb=$(echo "$numbb$add")
							fi
							
							if [ $ab -gt 16 ]   && [ $ab -le 24 ];
							then
								numbc=$(echo "$numbc$add")
							fi
							
							if [ $ab -gt 24 ]   && [ $ab -le 32 ];
							then
								numbd=$(echo "$numbd$add")
							fi
					

						done
						mask_bin=$(echo "$numba$numbb$numbc$numbd")
						#numba=$(echo $numba | sed s/./& /g)
						#numbb=$(echo $numbb | sed s/./& /g)
						#numbc=$(echo $numbc | sed s/./& /g)
						#numbd=$(echo $numbd | sed s/./& /g)
						#numa=$(echo $numa | sed s/./& /g)
						#numb=$(echo $numb | sed s/./& /g)
					#	numc=$(echo $numc | sed s/./& /g)
					#	numd=$(echo $numd | sed s/./& /g)
						netw_add=
						pqrs=8
						new=' '
						for (( n=1; n<33; n++ ))
						do
							if [ $n -le 8 ];
							then
								abc=$(echo $ip_bin | cut -c $n)
								def=$(echo $mask_bin | cut -c $n)
								and=$(( abc*def ))
								netw_add=$(echo $netw_add$and)

							fi
						        
							if [ $n -gt 8 ] && [ $n -le 16 ];
							then	
								abc=$(echo $ip_bin | cut -c $n)
								def=$(echo $mask_bin | cut -c $n)
								and=$(( abc*def ))
								netw_add=$(echo $netw_add$and)
							fi

							if [ $n -gt 16 ] && [ $n -le 24 ];
							then
								abc=$(echo $ip_bin | cut -c $n)
								def=$(echo $mask_bin | cut -c $n)
								and=$(( abc*def ))
								netw_add=$(echo $netw_add$and)
							fi

							if [ $n -gt 24 ] && [ $n -le 32  ];
							then
								abc=$(echo $ip_bin | cut -c $n)
								def=$(echo $mask_bin | cut -c $n)
								and=$(( abc*def ))
								netw_add=$(echo $netw_add$and)
							fi


							if [ $n -eq $pqrs ];
							then
								netw_add=$(echo "$netw_add$new")
								pqrs=$(( pqrs+8 ))

							fi
						done
						echo -e "\n\nBinary of Network address is \n $netw_add"

						net_address=''
						for (( k=1; k<5; k++ ))
						do
							block=$(echo "$netw_add" | awk -F ' ' -v var="$k" '{print $var}')
							value=128
							nu=1
							block_d=0
							for(( j=1; j<9; j++ ))
							do
								c=$(echo $block | cut -c $j)
								if [ $c == 1 ];
								then
									if [ $j == $nu ];
									then
										block_d=$(( block_d+value ))
										value=$(( value/2 ))
										nu=$(( nu+1 ))
									fi
								else
									echo -n ""
									nu=$(( nu+1 ))
									value=$(( value/2 ))
								fi


							done
							if  [ $k == 1 ];
							then
								net_address=$(echo "$net_address$block_d" )
							else
								net_address=$(echo "$net_address.$block_d")
							fi
						done
						echo -e "\n\nNetwork address is $net_address"
						
						read -p "Enter classify on the basis of Hosts or on the basis of Network N (Network)/H (Host): " choice
						if [ $choice == 'N' ] || [ $choice == 'n' ];
						then
							read -p "Enter the number of network " numm
							g=2
							abc=1
							while [ $g -lt $numm ]
							do
								g=$(( g*2 ))
								abc=$(( abc+1 ))

							done
							class_i=$(echo $net_address)
							new_mask=$(( abc+mask ))
							
							if [ $new_mask -gt 32 ];
							then
								echo "inavlid number of netwoork"
								break
							fi
							if [ $new_mask -le 8 ];
							then
								echo "INvalid"
								break
							elif [ $new_mask -gt 8 ] && [ $new_mask -le 16 ]
							then
								octet=2
								range=$(( new_mask-mask ))
							elif [ $new_mask -gt 16 ] && [ $new_mask -le 24 ]
							then
								octet=3
								range=$(( new_mask-mask  ))
							elif [ $new_mask -gt 24 ] && [ $new_mask -le 32 ]
							then
								octet=4
								range=$(( new_mask-mask ))
							fi
							adding=128
							for lo in {1..8}
							do
								if [ $range == $lo ];
								then
									block_size=$adding
								fi
								adding=$(( adding/2 ))

							done
							clear
						       	clear	
							clear
							echo -e "\t\t\e[31m Details of the subnetting\e[0m "
							echo -e "\nThe required mask with address is \n $net_address/$new_mask \n"

							echo -e "\nBlock size required to get the required number of network is $block_size\n"
							s_ip=$net_address
							echo -e "Start_ip\t\t End_ip"
							echo "---------------------------------------------------------------------------------------------------"
							new_net=$(echo "$s_ip" | awk -v var="$octet" -F '.' '{print $var}')
							store_octet=0
							
							for ((ii=0; ii<numm; ii++))
							do
								echo -n -e "$s_ip\t\t"
								next_octet=$(( new_net+block_size ))
								new_net=$next_octet
								octet2=$(( next_octet-1 ))
								if [ $octet == 4 ];
								then
									e_ip=$(echo $s_ip | awk -F '.' -v var="$octet" -v vv="$octet2" '$var=vv' | sed 's/ /./g')
								
								elif [ $octet == 3 ];
								then
									e_ip=$(echo $s_ip | awk -F '.' -v val="$octet2" '$3=val,$4=255' | sed 's/ /./g')
								
								elif [ $octet == 2 ];
								then
									e_ip=$(echo $s_ip | awk -F '.' -v val="$octet2" '$2=val,$3=255'| cut -d ' ' -f 4 --complement | awk -F ' ' '$4=255' | sed 's/  /./g' | sed 's/ /./g')
									
								fi
								
								echo "$e_ip"
								s_ip=$(echo $s_ip | awk -F '.' -v var="$octet" -v vv="$next_octet" '$var=vv' | sed 's/ /./g')
								
								


							done

						elif [ "i$choice" == 'ih' ] || [ "i$choice" == 'iH' ];
						then
							
							read -p "Enter the number of hosts that you want to enter " h_numm
							for (( rai=0; rai<$h_numm; rai++))
							do
								read -p "Number of hosts in a networks" host_numm[$rai]
							done
							echo "Arranging the hosts number in ascending order"
							sleep 1s
	# Arrganging host in asscending order
							for ((ck=0; ck<$h_numm; ck++ ))
							do
								for (( gk=$ck; gk<h_numm; gk++ ))
								do
									if [ ${host_numm[$ck]} -le ${host_numm[$gk]} ];
									then
										temp=${host_numm[$gk]}
										host_numm[$gk]=${host_numm[$ck]}
										host_numm[$ck]=$temp
									fi
								done
							done
							number_for=$(( h_numm+1 ))
							mask_host=
							ptr=8
							add=1
							d_mask=$mask
							modified_block=0
							clear 
							clear
							echo -e "\t\t Subnetting Details \n"
							for (( loom=0; loom<$h_numm; loom++ ))
							do


								if [ $modified_block -ge 256 ];
								then
									if [ $mask -ge 8 ] && [ $mask -lt 16 ];
									then
										if [ $(echo $e_ip | awk -F '.' '{print $2}') == 255 ];
										then
											echo "No more possible Ip's"
											break
										fi	
									elif [ $mask -ge 16 ] && [ $mask -lt 24 ];
									then

										if [ $(echo $e_ip | awk -F '.' '{print $3}') == 255 ];
										then 
											echo "No more possible Ip's"
											break
										fi
									else
										if [ $(echo $e_ip | awk -F '.' '{print $4}') == 255 ];
										then
										       	echo "No more possible Ip's"
											break
										fi

									fi
								fi
								echo "Host number in network ${host_numm[$loom]} "

								g=2
								abc=1
								abcde=1
								while [ $(( g-2 )) -lt ${host_numm[$loom]} ]
								do
									g=$(( g*2 ))
									abc=$(( abc+1 ))
								done
		# Making the mask for the current host network 
								
								for (( swap=1; swap<33; swap++ ))
								do 
									if [ $abcde -le $(( 32-abc  ))  ];
									then
										mask_host=$(echo $mask_host$add)
										abcde=$(( abcde+1 ))
									else
										add=0
										mask_host=$(echo $mask_host$add)
										abcde=$(( abcde+1 ))
									fi				
								done
								required_mask=$(( 32-abc  ))	
								default_mask=$mask
								if [ $required_mask == $default_mask ];
								then
									echo "$net_address/$required_mask"	
									read -p "last subnet possible " c
									break
								fi

								if [ $required_mask -lt  $d_mask ];
								then
									echo "that number of host is not possible in the condition in the ip that is $net_address/$required_mask"
								fi
								d_mask=$required_mask

								if [ $required_mask -le 8 ];
								then
									echo "INvalid"
									break
								elif [ $required_mask -gt 8 ] && [ $required_mask -le 16 ];
								then
									octet=2
									range=$(( required_mask-8 ))
								elif [ $required_mask -gt 16 ] && [ $required_mask -le 24 ];
								then
									octet=3
									range=$(( required_mask-16 ))
								elif [ $required_mask -gt 24 ] && [ $required_mask -le 32 ];
								then
									octet=4
									range=$(( required_mask-24 ))

								fi

								
				#getting the block size

								b=128
								for (( iq=1; iq<9; iq++ ))
								do
									if [ $range == $iq ];
									then
										block_size=$b
									fi
									b=$(( b/2 ))
								done 

								block=$(echo "$net_address" | awk -F '.' -v val="$octet" '{print $val}' )
								modified_block=$(( block + block_size ))
								

								echo "Block size is: $block_size"
								echo "Required mask for this Host number is $required_mask"

								octet2=$(( modified_block-1 ))	
								echo -n -e "$net_address\t\t"
								test $modified_block
								net_address=$(echo $net_address | awk -F '.' -v val="$modified_block" -v var="$octet" '$var=val' | sed 's/ /./g'  )
								if [ $octet == 4 ];
								then
									e_ip=$(echo $net_address | awk -F '.' -v var="$octet" -v vv="$octet2" '$var=vv' | sed 's/ /./g')
								
								elif [ $octet == 3 ];
								then
									e_ip=$(echo $net_address | awk -F '.' -v val="$octet2" '$3=val,$4=255' | sed 's/ /./g')
								
								elif [ $octet == 2 ];
								then
									e_ip=$(echo $net_address | awk -F '.' -v val="$octet2" '$2=val,$3=255'| cut -d ' ' -f 4 --complement | awk -F ' ' '$4=255' | sed 's/  /./g' | sed 's/ /./g')
									
								fi

								echo "$e_ip"
								echo -e "====================================================================================================\n"
								sleep 1s
							done
						fi				
					fi
					read -p "Enter to continue " e
				fi
			fi
		done
	fi

done
