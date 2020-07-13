#! /bin/bash -

#CONSTANTS
DAILY_AMOUNT=100;
DAILY_BET=1;
WON=1;
LOSS=0;
MAX_DAYS=30;

#ARRAY
declare -a recordHistory;
declare -a recordWinningHistory;
declare -a recordLossingHistory;

#VARIABLES
duplicateAmount=$((dailyAmount));
counterRecordHistory=0;
totalSum=0;
counterRecordWinningHistory=0;
counterRecordLossingHistory=0;
temp=0;

for((index=0;index<$MAX_DAYS;index++))
do

	duplicateAmount=$(($temp+$DAILY_AMOUNT));
	percentage=$((duplicateAmount/2))
   MAX_LIMIT=$(($duplicateAmount + $percentage ));
   MIN_LIMIT=$(($duplicateAmount - $percentage ));

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

		temp=$((duplicateAmount));

		recordHistory[((counterRecordHistory++))]=$((duplicateAmount));
		if [ $duplicateAmount -eq $MAX_LIMIT ]
		then
			recordWinningHistory[((counterRecordWinningHistory++))]=$((duplicateAmount))
			echo "Day " $counterRecordHistory " You Win! :" $duplicateAmount;

		elif [ $duplicateAmount -eq $MIN_LIMIT ]
		then
			recordLossingHistory[((counterRecordLossingHistory++))]=$((duplicateAmount))
			echo "Day " $counterRecordHistory " You Lost! :" $duplicateAmount;

		fi

done

recordHistoryLength=${#recordHistory[@]}


function sortRecordHistory(){

   for ((initIndex = 0; $initIndex<=$recordHistoryLength; initIndex++))
   do
       for((nextIndex = $(($initIndex + 1)); $nextIndex < $recordHistoryLength ; nextIndex++))
       do

          if [[ ${recordHistory[initIndex]} -gt ${recordHistory[nextIndex]} ]]
          then
            temp=${recordHistory[initIndex]}
            recordHistory[initIndex]=${recordHistory[nextIndex]}
            recordHistory[nextIndex]=$temp
           fi
       done
   done

echo "Your Unluckies Day: " ${recordHistory[0]};
echo "Your Luckiest Day: " ${recordHistory[29]};

}

echo "ArrayValues: " $recordHistoryLength;
echo "Number of record in WHistory: " ${#recordHistory[@]};
echo "Number of records in winning: " ${#recordWinningHistory[@]};
echo "Number of records in Lossing: " ${#recordLossingHistory[@]};


for index1 in ${recordHistory[@]}
do
    totalSum=$(($totalSum + $index1));

done

for index2 in ${recordWinningHistory[@]}
do
	winSum=$(($winSum + $index2))

done

for index3 in ${recordLossingHistory[@]}
do
	lossSum=$(($lossSum + $index3))

done


echo "Total Amount after 30 days: "$totalSum;
echo "Total Winning Days: " $counterRecordWinningHistory;
echo "Total Winning Amount: " $winSum;
echo "Total Lossing Days: " $counterRecordLossingHistory;
echo "Total Lossing Amount: " $lossSum;

monthlyAmount=$((dailyAmount*20))
moneyCheck=$((totalSum-monthlyAmount))

if [[ $moneyCheck -gt 0 ]]
then
	echo "Profit: " $moneyCheck;
else
	echo "Loss: " $moneyCheck;
fi


sortRecordHistory;
