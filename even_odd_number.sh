#User input numbers in range
#Display the number in even or add inbetween the sepcfied user supplied range

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
        elif [ -n "$second" ] && [ -z "$First" ]
        then
                echo "First number field is empty"
        else
                echo "Both field empty"
        fi
elif [ -n "$first" ] && [ -n "$second" ]
then
        echo "First number is: $first"
        echo "Second number is: $second"
        echo "*******************************"
        echo "Display Even for E or e"
        echo "Display Odd for O or o"
        read choice
        if [ "$choice" == "E" ] || [ "$choice" == "e" ]
        then
                echo "*******************************"
                for even_num in $(seq $first $second)
                do
                        if (( $even_num%2==0))
                        then
                                echo "Even number is: $even_num"
                        else
                                continue
                        fi
                done
        elif [ "$choice" == "O" ] || [ "$choice" == "o" ]
        then
                echo "*******************************"
                for odd_num in $(seq $first $second)
                do
                        if (( $odd_num%2!=0))
                        then
                                echo "Odd number is: $odd_num"
                        else
                                continue
                        fi
                done
        else
                echo "Something wrong with the user input"

        fi

fi
