#script to add two numbers and check whether the result is odd or even number

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
                echo "Issues with the user input"
        fi
elif [ -n "$first" ] && [ -n "$second" ]
then
        ans=$((first+second))
        if (($ans%2==0))
        then
                echo "*****************************************"
                echo "$first plus $second --> $ans"
                echo "$ans --> Even number"
                echo "*****************************************"
        elif (($ans%2!=0))
        then
                echo "*****************************************"
                echo "$first plus $second --> $ans"
                echo "$ans --> Odd number"
                echo "*****************************************"
        else
                echo "*****************************************"
                echo "Something went wrong"
                echo "*****************************************"
        fi
fi
