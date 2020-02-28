#!/bin/bash -x
echo "Start bet with stake 100"
#Constant
BET=1
WIN=0
LOSS=0
#Variables
count=0
stake=100
wincount=0
losscount=0
tempStake=$stake
tempStake1=$stake
for((day=1;day<=20;day++))
do
	stake=100
	half_stake=$(($stake/2))
	full_stake=$(($half_stake+$stake))
	loss_stake=$(($stake-$half_stake))
	while (($stake!=$full_stake&&$stake!= $loss_stake)) 
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
case $stake in
	$full_stake)
			echo "you won for the day"
			echo "Total win amount:" $half_stake
			tempStake=$((tempStake+half_stake))
			stakeWinArray[$((count++))]=$tempStake
			((wincount++))
			;;
	$loss_stake)
			echo "you loss"
			echo "Total loss amount:" $half_stake
			tempStake1=$((tempStake1-half_stake))
			stakeLossArray[$((count++))]=$tempStake1
			((losscount++))
			;;
esac
done
echo ${stakeWinArray[@]}
echo ${stakeLossArray[@]}
echo "no of day loss" $losscount
echo "you lost by:" $((losscount*half_stake))
echo "no of day win:" $wincount
echo "you win by:"$((wincount*half_stake))
