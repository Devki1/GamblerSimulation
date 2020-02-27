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
echo "you resigned the day"
echo "Present stake"=$stake

