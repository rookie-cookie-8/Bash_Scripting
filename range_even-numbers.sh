#for look 
# display even numbers within the user specified range

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
        echo "First number is: $first"
        echo "Second number is: $second"
        echo "**********************************"
        echo "Diplay Even numbers between $first and $second"
        echo "**********************************"
        for even in $(seq $first $second)
        do
                if(($even%2==0))
                then
                        echo "Even number: $even"
                else
                        continue
                fi

        done
fi
