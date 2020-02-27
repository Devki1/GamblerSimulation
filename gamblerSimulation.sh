#!/bin/bash -x
echo "Start bet with stake 100"
#Constant
BET=1
WIN=0
LOSS=0
#Variables
stake=100
half_stake=$(($stake/2))
full_stake=$(($half_stake+$stake))
for((day=1;day<=20;day++))
do
	stake=100
	half_stake=$(($stake/2))
	full_stake=$(($half_stake+$stake))
	while ((half_stake < stake && full_stake > stake)) 
	do 
		checkGambler=$((RANDOM%2))
		case $checkGambler in
			0)
				stake=$((stake+BET))
				((WIN++))
			;;
			1)
				stake=$((stake-BET))
				((LOSS++))
			;;
		esac
done	
array[$day]=WIN:$WIN,LOSS:$LOSS	
done
for value in ${array[@]}
do
	echo $value
done


