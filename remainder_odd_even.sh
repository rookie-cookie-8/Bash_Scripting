#Script to check whether the remainder by odd or even

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
        if [ $first -ge $second ]
        then
                ans=$((first%second))
                if (($ans%2==0))
                then
                        echo "Remainder is Zero"
                else
                        echo "Remainder is: $ans"
                fi
        else
                echo "Second number cannot be greater than first"
        fi
fi

