#! /bin/bash -x

#CONSTANTS
DAILY_AMOUNT=100;
DAILY_BET=1;
WON=1;
LOSS=0;
MAX_LIMIT=150;
MIN_LIMIT=50;
MAX_DAYS=20;
#ARRAY
declare -a recordHistory[100];

#VARIABLES
duplicateAmount=$((DAILY_AMOUNT));
counter=0;
sum=0;

for((i=0;i<$MAX_DAYS;i++))
do
	duplicateAmount=100;

	while [[ $duplicateAmount -gt $MIN_LIMIT && $duplicateAmount -lt $MAX_LIMIT ]]
	do

		betCheck=$((RANDOM%2));
   		case $betCheck in
         	      $WON)
            	         duplicateAmount=$((duplicateAmount+1));;
            #   	      echo "WON this bet";;

               	$LOSS)
                     	duplicateAmount=$((duplicateAmount-1));;
             #     	   echo "LOST this bet";;

                 		 *)
                     	echo "Wrong Input";;
   		esac
	done
	recordHistory[((counter++))]=$duplicateAmount;
done

aLenght=${recordHistory[@]}
echo "ArrayValues: " $aLenght;
echo "ArrayLenght" ${#recordHistory[@]};


for i in ${recordHistory[@]}
do
    sum=$(($sum + $i));

done
 echo "Total Amount after 10 days: "$sum;



#echo "New Amount: " $duplicateAmount;
