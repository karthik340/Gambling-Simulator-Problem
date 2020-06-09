#!/bin/bash -x

stake=100
bet=1


read -p "enter the percentage of won or loss of stake to stop betting for that day" percent


variableAmount=$(($percent*$(($stake/100))))
maxAmount=$variableAmount
minAmount=$((-1*$variableAmount))

totalAmountPerMonth=0
for (( day=0;day<20;day++ ))
do  
	totalAmountPerDay=0
	if [ $((RANDOM%2)) -eq 0 ]
	then
		totalAmountPerDay=$maxAmount
	else
		totalAmountPerDay=$minAmount
	fi
	totalAmountPerMonth=$(($totalAmountPerMonth+$totalAmountPerDay))
done

