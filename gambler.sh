#! /bin/bash 


#CONSTANTS
dailyAmount=100;
dailyBet=1;
won=1;
loss=0;
duplicateAmount=$((dailyAmount));
maxLimit=150;
minLimit=50;
maxDays=20;
monthlyAmount=$((dailyAmount*20))


#ARRAY
declare -a recordHistory[100];
declare -a recordWinningHistory[50];
declare -a recordLossingHistory[50];

#VARIABLES
counterRecordHistory=0;
sum=0;
counterRecordWinningHistory=0;
counterRecordLossingHistory=0;

for((index=0;index<$maxDays;index++))
	do

		duplicateAmount=$((temp+100));
		maxLimit=$(($duplicateAmount + (( $duplicateAmount / 2 )) ));
		minLimit=$(($duplicateAmount - (( $duplicateAmount / 2 )) ));

		while [[ $duplicateAmount -gt $minLimit && $duplicateAmount -lt $maxLimit ]]
		do

			betCheck=$((RANDOM%2));
   			case $betCheck in
         		      $won)
            		         duplicateAmount=$((duplicateAmount+1));;

               		$loss)
                     		duplicateAmount=$((duplicateAmount-1));;

                 		 	*)
                     		echo "Wrong Input";;
   			esac
		done

			temp=$((duplicateAmount));

			recordHistory[((counterRecordHistory++))]=$((duplicateAmount));
			if [ $duplicateAmount -eq $maxLimit ]
			then
				recordWinningHistory[((counterRecordWinningHistory++))]=$((duplicateAmount))
				echo "Day " $counterRecordHistory " You Win! :" $duplicateAmount;

			elif [ $duplicateAmount -eq $minLimit ]
			then
				recordLossingHistory[((counterRecordLossingHistory++))]=$((duplicateAmount))
				echo "Day " $counterRecordHistory " You Lost! :" $duplicateAmount;

			fi

done

	aLenght=${#recordHistory[@]}


function sortArray(){

	for ((index = 0; index<=$aLenght; index++))
	do
   	 for((j = index + 1; j < $aLenght ; j++))
    	 do

       	 if [[ ${recordHistory[index]} -gt ${recordHistory[j]} ]]
       	 then
				temp=${recordHistory[index]}
            recordHistory[index]=${recordHistory[j]}
            recordHistory[j]=$temp
	        fi
   	 done
	done


echo "Array in sorted order :"
for((i=0;i<aLenght;i++))
do
echo ${recordHistory[i]}
done
echo "Your Unluckies Day: " ${recordHistory[0]};
echo "Your Luckiest Day: " ${recordHistory[19]};

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

echo "Total Amount after 20 days: "$totalSum;
echo "Total Winning Days: " $counterRecordWinningHistory;
echo "Total Winning Amount: " $winSum;
echo "Total Lossing Days: " $counterRecordLossingHistory;
echo "Total Lossing Amount: " $lossSum;
}

function monthlyProfitLoss(){

	moneyCheck=$((totalSum-monthlyAmount))
	if [[ $moneyCheck -gt 0 ]]
	then
		echo "Profit: " $moneyCheck;
		echo "Your Game will be continued for next Month";
		duplicateAmount=$((moneyCheck+duplicateAmount));
		echo "New Amount for this Month: " $duplicateAmount;
	else
		echo "Loss: " $moneyCheck;
		echo "You are in debt! Unfortunatly you CAN'T continue."
	fi
}

#-------------------------------------------------------------------------------------


sortArray
sumTotalHistory
sumWinningHistory
sumLosingHistory
displayRecords
monthlyProfitLoss
