#two numbers as input from the user
#script checks condition
#if all ok, the script ask user to print even or odd numbers
# based upon the user input i.e. odd or even, the numbers are displayed. 

#!/bin/bash

echo "Enter the first number"
read first
echo "Enter the second number"
read second 

if [ -z "$first" ] || [ -z "$second" ]
then
        if [ -n "$first" ] && [ -z "$second" ]
        then
                echo "***************************************"
                echo "Second number field is empty"
        elif [ -z "$first" ] && [ -n "$second" ]
        then
                echo "***************************************"
                echo "First number field is empty"
        else
                echo "***************************************"
                echo "Issues with the user input"
        fi
elif [ -n "$first" ] && [ -n "$second" ]
then
        if [ $first -lt $second ]
        then
                echo "******************************************"
                echo "Would you like to print odd or even number?"
                read answer
                if [ "$answer" == "odd" ]
                then
                        for odd_numbers in $(seq $first $second)
                        do
                                if (($odd_numbers%2!=0))
                                then
                                        echo "Odd number is --> $odd_numbers"
                                fi
                        done
                elif [ "$answer" == "even" ]
                then
                        for even_numbers in $(seq $first $second)
                        do
                                if (($even_numbers%2==0))
                                then
                                        echo "Even number is --> $even_numbers"
                                fi
                        done
                else
                        echo "Invalid user input"
                fi
        else
                echo "Second number is less than first"
                echo "Nothing to do"
        fi
fi
