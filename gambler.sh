#! /bin/bash

#CONSTANTS
DAILY_AMOUNT=100;
DAILY_BET=1;
WON=1;
LOSS=0;
MAX_LIMIT=150;
MIN_LIMIT=50;
MAX_DAYS=20;
#ARRAY
declare -a recordHistory;

#VARIABLES
counter=0;
totalSum=0;

for((index=0;index<$MAX_DAYS;index++))
do
	duplicateAmount=$((DAILY_AMOUNT));

	while [[ $duplicateAmount -gt $MIN_LIMIT && $duplicateAmount -lt $MAX_LIMIT ]]
	do

		betCheck=$((RANDOM%2));
   		case $betCheck in
         	      $WON)
            	         duplicateAmount=$((duplicateAmount+1));;

               	$LOSS)
                     	duplicateAmount=$((duplicateAmount-1));;

                 		 *)
                     	echo "Wrong Input";;
   		esac
	done
	recordHistory[((counter++))]=$duplicateAmount;
done

recordHistoryLength=${recordHistory[@]}
echo "Records: " $recordHistoryLength;


for index in ${recordHistory[@]}
do
    totalSum=$(($totalSum + $index));

done
 echo "Total Amount after 20 days: "$totalSum;
