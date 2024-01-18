#basic calculation

#!/bin/bash

echo "Enter the first number"
read first
echo "Enter the second number"
read second 

if [ -z "$first" ] || [ -z "$second" ]
then
        if [ -z "$first" ] && [ -n "$second" ]
        then
                echo "First number field is empty"
        elif [ -n "$first" ] && [ -z "$second" ]
        then
                echo "Second number field is empty"
        else
                echo "Both number field is empty"
        fi

elif [ -n "$first" ] && [ -n "$second" ]
then
        echo "**************************************"
        echo "First number is: $first"
        echo "Second number is: $second"
        echo "**************************************"
        echo "Press 1 --> Addition"
        echo "Press 2 --> Subtraction"
        echo "Press 3 --> Multiplication"
        echo "Press 5 --> Power"
        echo "Press 5 --> Remainder"
        echo "Press 6 --> Quotient"
        read option
        echo "***********************************************"
        if [ "$option" == "1" ]
        then
                ans=$((first+second))
                echo "$first + $second --> $ans"
        elif [ "$option" == "2" ]
        then
                ans=$((first-second))
                echo "$first - $second --> $ans"
        elif [ "$option" == "3" ]
        then
                ans=$((first*second))
                echo "$first * $second --> $ans"
        elif [ "$option" == "4" ]
        then
                ans=$((first**second))
                echo "$first power $second --> $ans"
        elif [ "$option" == "5" ]
        then
                ans=$((first%second))
                echo "$first % $second --> $ans"
        elif [ "$option" == "6" ]
        then
                ans=$((first/second))
                echo "$first / $second --> $ans"
        fi
fi
