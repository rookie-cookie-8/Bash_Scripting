#Basic while loop: User inputs the first number, multiplier, and stop number. 
#The first number is then multiplied by the multiplier until reaching the stop number

#!/bin/bash

echo "Enter the first number"
read first
echo "Enter the multiplier"
read multiplier
echo "Enter the stop number"
read stop_number

if [ -z "$first" ] || [ -z "$multiplier" ] || [ -z "$stop_number" ]
then
        if [ -n "$first" ] && [ -z "$multiplier" ] && [ -z "$stop_number" ]
        then
                echo "**********************************"
                echo "Multiplier field is empty"
                echo "Stop number field is empty"
        elif [ -n "$first" ] && [ -n "$multiplier" ] && [ -z "$stop_number" ]
        then
                echo "**********************************"
                echo "Stop number field is empty"
        elif [ -n "$first" ] && [ -z "$multiplier" ] && [ -n "$stop_number" ]
        then
                echo "**********************************"
                echo "Multiplier field is empty"
        elif [ -z "$first" ] && [ -n "$multiplier" ] && [ -n "$stop_number" ]
        then
                echo "**********************************"
                echo "First number field is empty"
        elif [ -z "$first" ] && [ -n "$multiplier" ] && [ -z "$stop_number" ]
        then
                echo "**********************************"
                echo "First number field is empty"
                echo "Stop number field is empty"
        elif [ -z "$first" ] && [ -z "$multiplier" ] && [ -n "$stop_number" ]
        then
                echo "**********************************"
                echo "First number field is empty"
                echo "Multiplier field is empty"
        elif [ -z "$first" ] && [ -z "$multiplier" ] && [ -z "$stop_number" ]
        then
                echo "**********************************"
                echo "First number field is empty"
                echo "Multiplier field is empty"
                echo "Stop number field is empty"
        else
                echo "**********************************"
                echo "Something went wrong"
        fi
elif [ -n "$first" ] && [ -n "$multiplier" ] && [ -n "$stop_number" ]
then
        ans=$((first*multiplier))
        if [ $ans -lt $stop_number ]
        then
                while [ $ans -lt $stop_number ]
                do
                        echo "***********************************"
                        echo "$first times $multiplier --> $ans"
                        ((multiplier++))
                        ans=$((first*multiplier))
                done
        else
                echo "***********************************"
                echo "$first times $multiplier --> $ans"
                echo "$ans is greater than $stop_number"
                echo "Cant do anything"
        fi
fi
