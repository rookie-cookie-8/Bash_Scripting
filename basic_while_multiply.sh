#basic multiply while loop
#check if the multiplication of first and second number 
#if the result is greater than 1000 then quit, else continue  

#!/bin/bash

echo "Enter the first number"
read first
echo "Enter the Multiplication number"
read multiplier
echo "Enter the stop number"
read stop_number

if [ -z "$first" ] || [ -z "$multiplier" ] || [ -z "$stop_number" ]
then
        if [ -n "$first" ] && [ -z "$multiplier" ] && [ -z "$stop_number" ]
        then
                echo "Multiplier field is empty"
                echo "Stop number field is empty"
        elif [ -n "$first" ] && [ -n "$multiplier" ] && [ -z "$stop_number" ]
        then
                echo "Stop number field is empty"
        elif [ -n "$first" ] && [ -z "$multiplier" ] && [ -n "$stop_number" ]
        then
                echo "Multiplier field is empty"
        elif [ -z "$first" ] && [ -n "$multiplier" ] && [ -z "$stop_number" ]
        then
                echo "First field is empty"
                echo "Stop number field is empty"
        elif [ -z "$first" ] && [ -n "$multiplier" ] && [ -n "$stop_number" ]
        then
                echo "First number field is empty"
        elif [ -z "$first" ] && [ -z "$multiplier" ] && [ -n "$stop_number" ]
        then
                echo "First field is empty"
                echo "Multiplier field is empty"
        elif [ -z "$first" ] && [ -z "$multiplier" ] && [ -z "$stop_number" ]
        then
                echo "First field is empty"
                echo "Multiplier field is empty"
                echo "Stop number field is empty"
        fi
elif [ -n "$first" ] && [ -n "$multiplier" ] && [ -n "$stop_number" ]
then
        ans=$((first*multiplier))
        if [ $ans -lt $stop_number ]
        then
                while [ $ans -lt $stop_number ]
                do
                        echo "************************************************"
                        echo "$first * $multiplier --> $ans"
                        ((multiplier++))
                        ans=$((first*multiplier))
                        sleep 0.2
                done
        else
                echo "Result of $first times $multiplier is greater than $stop_number"
                echo "Cant do anything"
        fi
fi

   

---------------------------------------------------------------------------------------------------------------------------------------------------------
#while loop 

#!/bin/bash

function user-input {
        echo "Enter the first number"
        read first
        echo "Enter the second number"
        read second
}

function validation_1 {
        if [ -z "$first" ] || [ -z "$second" ]
        then
                if [ -n "$first" ] && [ -z "$second" ]
                then
                        echo "Second number field is empty"
                        again
                elif [ -z "$first" ] && [ -n "$second" ]
                then
                        echo "First number field is empty"
                        again
                else
                        echo "User input is missing"
                        again
                fi
        fi
}
function validation_2 {
        if [ -n "$first" ] && [ -n "$second" ]
        then
                echo "*********************************"
                echo "First number is: $first"
                echo "Second number is: $second"
                echo "*********************************"
                ans=$((first+second))
                if (($ans%2==0))
                then
                        echo "Result of addition --> $ans"
                        echo "$ans --> Even number"
                        echo "*********************************"
                        again
                else
                        echo "Result of addition --> $ans"
                        echo "$ans --> odd number"
                        echo "*********************************"
                        again
                fi
        fi
}
function again {
        echo "Would you like to perform the action once again"
        read option
        if [ "$option" == "Y" ] || [ "$option" == "y" ]
        then
                user-input
                validation_1
                validation_2
        else
                echo "bye"
        fi
}



user-input
validation_1
validation_2



