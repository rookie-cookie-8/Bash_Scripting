#calucation bash script with functions 

#!/bin/bash

function user_input {
        echo "ENter the first number"
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
                        try_again
                elif [ -z "$first" ] && [ -n "$second" ]
                then
                        echo "First number field is empty"
                        try_again
                else
                        echo "Issues with the user input"
                        try_again
                fi

        fi
}
function validation_2 {
        if [ -n "$first" ] && [ -n "$second" ]
        then
                echo "*************************************"
                echo "Press 1 --> Addition"
                echo "Press 2 --> Subtraction"
                echo "Press 3 --> Multiplication"
                echo "Press 4 --> Power"
                read option 
                if [ "$option" == "1" ]
                then
                        ans=$((first+second))
                        echo "*************************************"
                        echo "$first plus $second --> $ans"
                        try_again
                elif [ "$option" == "2" ]
                then
                        ans=$((first-second))
                        echo "*************************************"
                        echo "$first minus $second --> $ans"
                        try_again
                elif [ "$option" == "3" ]
                then
                        ans=$((first*second))
                        echo "*************************************"
                        echo "$first multiply $second --> $ans"
                        try_again
                elif [ "$option" == "4" ]
                then
                        ans=$((first**second))
                        echo "*************************************"
                        echo "$first power $second --> $ans"
                        try_again
                else
                        echo "*************************************"
                        echo "Invalid user input"
                        try_again
                fi
        fi
}
function try_again {
        echo "Would you like to try again: Y/y or N/n"
        read answer
        if [ "$answer" == "Y" ] || [ "$answer" == "y" ]
        then
                user_input
                validation_1
                validation_2
        elif [ "$answer" == "N" ] || [ "$answer" == "n" ]
        then
                echo "Bye"
        else
                echo "Invalid user input"
        fi
}
user_input
validation_1
validation_2
