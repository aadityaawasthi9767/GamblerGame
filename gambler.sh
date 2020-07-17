#! /bin/bash 


#CONSTANTS
DAILY_AMOUNT=100;
DAILY_BET=1;
WON=1;
LOSS=0;
duplicateAmount=$((dailyAmount));
MAX_DAYS=30;
monthlyAmount=$((dailyAmount*20))

#ARRAY
declare -a recordHistory;
declare -a recordWinningHistory;
declare -a recordLossingHistory;

#VARIABLES
counterRecordHistory=0;
sum=0;
counterRecordWinningHistory=0;
counterRecordLossingHistory=0;
temp=0;

for((index=0;index<$MAX_DAYS;index++))
	do

		duplicateAmount=$((temp+100));
		percentage=$(($duplicateAmount/2))
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

	for ((initIndex = 0; initIndex<=$recordHistoryLength; initIndex++))
	do
   	 for((nextIndex = initIndex + 1; nextIndex < $recordHistoryLength ; nextIndex++))
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

echo "Number of record in whole record History: " ${#recordHistory[@]};
echo "Number of records in winning: " ${#recordWinningHistory[@]};
echo "Number of records in Lossing: " ${#recordLossingHistory[@]};


function sumTotalHistory(){

	for index in ${recordHistory[@]}
	do
   	 totalSum=$(($totalSum + $index));
	done
}


function sumWinningHistory(){

	for index in ${recordWinningHistory[@]}
	do
		winSum=$(($winSum + $index));
	done
}


function sumLosingHistory(){

	for index in ${recordLossingHistory[@]}
	do
		lossSum=$(($lossSum + $index))
	done
}


function displayRecords(){

	echo "Total Amount after 30 days: "$totalSum;
	echo "Total Winning Days: " $counterRecordWinningHistory;
	echo "Total Winning Amount: " $winSum;
	echo "Total Lossing Days: " $counterRecordLossingHistory;
	echo "Total Lossing Amount: " $lossSum;
}

function monthlyProfitLoss(){

	moneyCheck=$((totalSum-monthlyAmount))
	if [[ $moneyCheck -gt 0 ]]
	then
		echo "Profit: " $moneyCheck "Your Game will be continued for next Month";
		duplicateAmount=$((moneyCheck+duplicateAmount));
		echo "New Amount for this Month: " $duplicateAmount;
	else
		echo "Loss: " $moneyCheck "You are in debt! Unfortunatly you CAN'T continue."
	fi
}

function storingRecords(){

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

}

#-------------------------------------------------------------------------------------


sortRecordHistory
sumTotalHistory
sumWinningHistory
sumLosingHistory
displayRecords
monthlyProfitLoss
storingRecords
