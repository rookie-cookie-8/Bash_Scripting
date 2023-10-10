#script: Two numbers as user input -->Display the addition of numbers and check whether the result id odd or even number. 

#!/bin/bash

echo "Enter the first number"
read first

echo "Enter the second number"
read second

if [ -z "$first" ] || [ -z "$second" ]
then
        if [ -n "$first" ] && [ -z "$second" ]
        then
                echo "Second number field empty"
        elif [ -z "$first" ] && [ -n "$second" ]
        then
                echo "First number field empty"
        else
                echo "Something wrong with user input"
        fi
elif [ -n "$first" ] && [ -n "$second" ]
then
        ans=$((first+second))
        if (($ans%2==0))
        then
                echo "$first plus $second is: $ans"
                echo "Answer is even number"
        else
                echo "$first plus $second is: $ans"
                echo "Answer is Odd number"
        fi


fi

