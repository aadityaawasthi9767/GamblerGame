#! /bin/bash -


#CONSTANTS
dailyAmount=100;
dailyBet=1;
won=1;
loss=0;
maxLimit=150;
minLimit=50;
maxDays=20;

#ARRAY
declare -a recordHistory[100];
declare -a recordWinningHistory[50];
declare -a recordLossingHistory[50];

#VARIABLES
duplicateAmount=$((dailyAmount));
counterRecordHistory=0;
totalSum=0;
counterRecordWinningHistory=0;
counterRecordLossingHistory=0;

for((i=0;i<$maxDays;i++))
do
	duplicateAmount=100;

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

aLenght=${recordHistory[@]}
echo "ArrayValues: " $aLenght;
echo "Number of record in WHistory: " ${#recordHistory[@]};
echo "Number of records in winning: " ${#recordWinningHistory[@]};
echo "Number of records in Lossing: " ${#recordLossingHistory[@]};


for i in ${recordHistory[@]}
do
    totalSum=$(($totalSum + $i));

done

for j in ${recordWinningHistory[@]}
do
	winSum=$(($winSum + $j))

done

for k in ${recordLossingHistory[@]}
do
	lossSum=$(($lossSum + $k))

done


echo "Total Amount after 20 days: "$totalSum;
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
