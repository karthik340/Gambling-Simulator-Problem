#!/bin/bash -x

stake=100
bet=1
choice=1


while [ $choice -eq 1 ]
do
	read -p "enter the percentage of won or loss of stake to stop betting for that day" percent

	luckiestDay=1
	unLuckiestDay=1
	max=0
	min=0
	variableAmount=$(($percent*$(($stake/100))))
	maxAmount=$variableAmount
	minAmount=$((-1*$variableAmount))
	counter=0
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
		storeAmountPerDay[((counter++))]=$totalAmountPerDay
		totalAmountPerMonth=$(($totalAmountPerMonth+$totalAmountPerDay))


		if [ $max -lt $totalAmountPerMonth ]
		then
			max=$totalAmountPerDay
			luckiestDay=$(($day+1))
		elif [ $min -gt $totalAmountPerMonth ]
		then
			min=$totalAmountPerDay
			unLuckiestDay=$(($day+1))
		fi

	done

	if [ $totalAmountPerMonth -gt 0 ]
	then
		read -p "Enter 1 to continue for next month else 0" choice
	else
		choice=0
	fi

done


