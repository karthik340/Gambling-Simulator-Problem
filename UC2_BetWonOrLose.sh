#!/bin/bash -x

stake=100
bet=1

if [ $((RANDOM%2)) -eq 0 ]
then
	result="win"
else
	result="loss"
fi

