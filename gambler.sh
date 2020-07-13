#! /bin/bash -x

#CONSTANTS
DAILY_AMOUNT=100;
DAILY_BET=1;
WON=1;
LOSS=0;

duplicateAmount=$((DAILY_AMOUNT));


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

echo "New Amount: " $duplicateAmount;
