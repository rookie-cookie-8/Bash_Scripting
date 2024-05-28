#user input --> credit score and total cost of the house
#based upon the credit score, down payment is calculated

#!/bin/bash

echo "Enter the credit score"
read credit_score
echo "Enter the house amount"
read house_amount

if [ -z "$credit_score" ] || [ -z "$house_amount" ]
then
        if [ -n "$credit_score" ] && [ -z "$house_amount" ]
        then
                echo "*****************************************"
                echo "House price field is empty"
        elif [ -z "$credit_score" ] && [ -n "$house_amount" ]
        then
                echo "*****************************************"
                echo "Credit score field is empty"
        elif [ -z "$credit_score" ] && [ -z "$house_amount" ]
        then
                echo "*****************************************"
                echo "Credit score field is empty"
                echo "House price field is empty"
        else
                echo "*****************************************"
                echo "Issues with the user input"

        fi
elif [ -n "$credit_score" ] && [ -n "$house_amount" ]
then
        if [ "$credit_score" -ge 750 ]
        then
                echo "**************************************"
                ans=$((house_amount*20/100))
                echo "Down payment require --> $ans"
        elif [ "$credit_score" -lt 750 ] && [ "$credit_score" -ge 650 ]
        then
                echo "**************************************"
                ans=$((house_amount*30/100))
                echo "Down payment require --> $ans"
        else
                echo "**************************************"
                echo "Try again later"

        fi
fi
