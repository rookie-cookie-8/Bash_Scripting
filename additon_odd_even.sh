#script: Two numbers as user input -->Display the addition of numbers and check whether the result is odd or even number. 

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
-----------------------------------------------------------------------------------------------------------------------------------------
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

