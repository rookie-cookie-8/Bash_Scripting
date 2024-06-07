#Basic while loop: User inputs the first number, multiplier, and stop number. 
#The first number is then multiplied by the multiplier until reaching the stop number
#if the result of multiplication i.e. first times $multiplier is greater than stop_number .. nothing to do
#or else do the multiplication until the result is less than stop_number

#!/bin/bash

echo "Enter the first number"
read first
echo "Enter the multiplier number"
read multiplier
echo "Enter the stop number"
read stop_number


if [ -z "$first" ] || [ -z "$multiplier" ] || [ -z "$stop_number" ]
then
        if [ -n "$first" ] && [ -z "$multiplier" ] && [ -z "$stop_number" ]
        then
                echo "**************************************"
                echo "Multiplier number field empty"
                echo "Stop number field empty"
        elif [ -n "$first" ] && [ -n "$multiplier" ] && [ -z "$stop_number" ]
        then
                echo "**************************************"
                echo "Stop number field empty"
        elif [ -n "$first" ] && [ -z "$multiplier" ] && [ -n "$stop_number" ]
        then
                echo "**************************************"
                echo "Multiplier number field empty"
        elif [ -z "$first" ] && [ -n "$multiplier" ] && [ -n "$stop_number" ]
        then
                echo "**************************************"
                echo "First number field empty"
        elif [ -z "$first" ] && [ -z "$multiplier" ] && [ -n "$stop_number" ]
        then
                echo "**************************************"
                echo "First number field empty"
                echo "Multiplier number field empty"
        elif [ -z "$first" ] && [ -n "$multiplier" ] && [ -z "$stop_number" ]
        then
                echo "**************************************"
                echo "First number field empty"
                echo "Stop number field empty"
        elif [ -z "$first" ] && [ -z "$multiplier" ] && [ -z "$stop_number" ]
        then
                echo "**************************************"
                echo "First number field empty"
                echo "Multiplier number field empty"
                echo "Stop number field empty"
        else
                echo "**************************************"
                echo "Something went wrong"
        fi

elif [ -n "$first" ] && [ -n "$multiplier" ] && [ -n "$stop_number" ]
then
        ans=$((first*multiplier))
        if [ $ans -le $stop_number ]
        then
                while [ $ans -le $stop_number ]
                do
                        ans=$((first*multiplier))
                        echo "*******************************************"
                        echo "$first times $multiplier  --> $ans"
                        ((multiplier++))
                        sleep 0.5

                done
        elif [ $ans -gt $stop_number ]
        then
                echo "**************************************"
                echo "$first times $multiplier --> $ans"
                echo "$ans greater than or equal to $stop_number"
                echo "Nothing to do"
        else
                echo "Something went wrong"
        fi
fi
