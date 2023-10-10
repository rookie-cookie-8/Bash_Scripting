#Script for basic calucation
#!/bin/bash

echo "Enter the first number"
read first

echo "Enter the second number"
read second

if [ -z "$first" ] || [ -z "$second" ]
then
        if [ -n "$first" ] && [ -z "$second" ]
        then
                echo "Second number field is empty"
        elif [ -z "$first" ] && [ -n "$second" ]
        then
                echo "First number field is empty"
        else
                echo "Something wrong with user input"
        fi

elif [ -n "$first" ] && [ -n "$second" ]
then
        echo "****************************************************"
        echo "Press 1 for Addition"
        echo "Press 2 for Subtraction"
        echo "Press 3 for Multiplication"
        echo "Press 4 for Quotient"
        echo "Press 5 for Remainder"
        echo "Press 6 for Power"
        echo "****************************************************"
        read input
        if [ "$input" == "1" ]
        then
                ans=$((first+second))
                echo "$first plus $second is: $ans"
        elif [ "$input" == "2" ]
        then
                ans=$((first-second))
                echo "$first Subtraction $second is: $ans"
        elif [ "$input" == "3" ]
        then
                ans=$((first*second))
                echo "$first Multiplication $second is: $ans"
        elif [ "$input" == "4" ]
        then
                if [ $first -ge $second ]
                then
                        ans=$((first/second))
                        echo "$first divide $second is : $ans --> Divisor"
                else
                        echo "Second number cannot be greater than first"
                fi
        elif [ "$input" == "5" ]
        then
                if [ $first -ge $second ]
                then
                        ans=$((first%second))
                        echo "$first divide $second is : $ans --> Remainder"
                else
                        echo "Second number cannot be greater than first"
                fi
        elif [ "$input" == "6" ]
        then
                ans=$((first**second))
                echo "$first power $second is: $ans"
        fi
fi
