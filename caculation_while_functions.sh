#basic calculation
#used functions as example 

#!/bin/bash

function user_input {
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
                        echo "Issues with the user input"
                        again
                fi
        fi
}
function validation_2 { 
        if [ -n "$first" ] && [ -n "$second" ]
        then
                echo "*******************************************"
                echo "First number is -- $first"
                echo "Second number is -- $second"
                echo "*******************************************"
                echo "Press 1 -- Addition"
                echo "Press 2 -- Subtraction"
                echo "Press 3 -- Multiplication"
                echo "Press 4 -- Power"
                read option
                if [ "$option" == "1" ]
                then
                        ans=$((first+second))
                        echo "*******************************************"
                        echo "$first plus $second --> $ans"
                        again
                elif [ "$option" == "2" ]
                then
                        ans=$((first-second))
                        echo "*******************************************"
                        echo "$first minus $second --> $ans"
                        again
                elif [ "$option" == "3" ]
                then
                        ans=$((first*second))
                        echo "*******************************************"
                        echo "$first multiply $second --> $ans"
                        again
                elif [ "$option" == "4" ]
                then
                        ans=$((first**second))
                        echo "*******************************************"
                        echo "$first power $second --> $ans"
                        again
                else
                        echo "Invalid user input"
                        again
                fi
        fi
}
function again {
        echo "Would you like to try again.? Y/y or N/n"
        read answer
        if [ "$answer" == "Y" ] || [ "$answer" == "y" ]
        then
                user_input
                validation_1
                validation_2
        elif [ "$answer" == "N" ] || [ "$answer" == "n" ]
        then
                echo "You choose, not to continue"
                echo "Bye"
        else
                echo "Invalid user input"
                echo "Bye"
        fi
}
user_input
validation_1
validation_2
