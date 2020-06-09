#!/bin/bash -x

stake=100
bet=1


read -p "enter the percentage of won or loss of stake to stop betting for that day" percent

totalAmountPerDay=0
variableAmount=$(($percent*$(($stake/100))))
maxAmount=$variableAmount
minAmount=$((-1*$variableAmount))



while [ $totalAmountPerDay -lt $maxAmount -a $totalAmountPerDay -gt $minAmount ]
do
	if [ $((RANDOM%2)) -eq 0 ]
	then
		totalAmountPerDay=$(($totalAmountPerDay+$bet))
	else
		totalAmountPerDay=$(($totalAmountPerDay-$bet))
	fi
done


