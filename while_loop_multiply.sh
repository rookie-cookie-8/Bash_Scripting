#while loop with multiplication and where the multiplication should continue and stop. 
#script design for practice

#!/bin/bash

echo "Enter the first number"
read first
echo "Enter the second number"
read second

echo "Where to stop"
read stop

if [ -z "$first" ] || [ -z "$second" ] || [ -z "$stop" ]
then
        if [ -n "$first" ] && [ -n "$second" ] && [ -z "$stop" ]
        then
                echo "Stop field empty"
        elif [ -n "$first" ] && [ -z "$second" ] && [ -n "$stop" ]
        then
                echo "Second field empty"
        elif [ -z "$first" ] && [ -n "$second" ] && [ -n "$stop" ]
        then
                echo "First field empty"
        else
                echo "Something missing from the user input"
        fi


elif [ -n "$first" ] && [ -n "$second" ] && [ -n "$stop" ]
then
        ans=$((first*second))
        if [ $ans -lt $stop ]
        then
                while [ $ans -lt $stop ]
                do
                        if [ $ans -ne 50 ]
                        then
                                ans=$((first*second))
                                echo "$first * $second is: $ans"
                                ((second++))
                                ans=$((first*second))
                        else
                                ((second++))
                                ans=$((first*second))
                                continue
                        fi
                done
        else
                echo "$first times $second greater than $stop"
        fi
fi
