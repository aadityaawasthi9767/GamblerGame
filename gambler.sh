#! /bin/bash -x

#CONSTANTS
DAILY_AMOUNT=100;
DAILY_BET=1;
WON=1;
LOSS=0;
MAX_LIMIT=150;
MIN_LIMIT=50;

duplicateAmount=$((DAILY_AMOUNT));

while [[ $duplicateAmount -ge $MIN_LIMIT && $duplicateAmount -le $MAX_LIMIT ]]
do

betCheck=$((RANDOM%2));
   case $betCheck in
               $WON)
                     duplicateAmount=$((duplicateAmount+1));
                     echo "WON this bet";;

               $LOSS)
                     duplicateAmount=$((duplicateAmount-1));
                     echo "LOST this bet";;

                  *)
                     echo "Wrong Input";
   esac
done
echo "New Amount: " $duplicateAmount;
