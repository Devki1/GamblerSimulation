#!/bin/bash -x
echo "Start bet with stake 100"
#Constant
BET=1
WIN=0
LOSS=1
#Variables
stake=100
#Generate two random value
checkGambler=$((RANDOM%2))
if((checkGambler == WIN))
then
	echo "You stake  is win"
	stake=$((stake+BET))
else
	echo "You loss stake"
	stake=$((stake-BET))
fi
