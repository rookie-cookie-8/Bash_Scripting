#Script --> Calculations, functions and while loop 

#!/bin/bash

function calculation {
        echo "*****************************************************"
        echo "Enter your Choice"
        echo "Press 1 for Addition"
        echo "Press 2 for Subtraction"
        echo "Press 3 for Multiplication"
        echo "Press 4 for Divisor"
        echo "Press 5 for Remainder"
        echo "Press 6 for Power"
        read choice
        echo "*****************************************************"
        if [ "$choice" == "1" ]
        then
                ans=$((first+second))
                echo "$first plus $second is: $ans"
        elif [ "$choice" == "2" ]
        then
                ans=$((first-second))
                echo "$first Subtract $second is: $ans"
        elif [ "$choice" == "3" ]
        then
                ans=$((first*second))
                echo "$first Multiply $second is: $ans"
        elif [ "$choice" == "4" ]
        then
                if [ $first -ge $second ]
                then
                        ans=$((first/second))
                        echo "$first Divide $second is: $ans --> Divisor"
                else
                        echo "Second number cannot be greater than first"
                fi
        elif [ "$choice" == "5" ]
        then
                if [ $first -ge $second ]
                then
                        ans=$((first%second))
                        echo "$first Divide $second is: $ans --> Quotient"
                else
                        echo "Second number cannot be greater than first"
                fi
        elif [ "$choice" == "6" ]
        then
                ans=$((first**second))
                echo "$first Power $second is: $ans"
        fi
}
function input {
        echo "Enter the First number"
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
        fi
}

input
if [ -n "$first" ] && [ -n "$second" ]
then
        calculation
        echo "***************************************************"
        echo "Would you like to calculation again: Y or N"
        read choice
        while [ "$choice" == "Y" ]
        do
                input
                calculation
                echo "Would you like to calculation again: Y or N"
                read choice
                if [ "$choice" == "Y" ]
                then
                        continue
                else
                        break
                fi
        done



fi
