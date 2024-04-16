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
                echo "Second number field is empty"
        elif [ -z "$first" ] && [ -n "$second" ]
        then
                echo "First number field is empty"
        else
                echo "Issues with the user input"
        fi
elif [ -n "$first" ] && [ -n "$second" ]
then
        echo "**************************************************"
        if [ $first -lt $second ] && [ $first -ne $second ]
        then
                echo "Would you like to print even or odd numbers"
                read option
                if [ "$option" == "even" ]
                then
                        echo "Displaying even numbers"
                        sleep 0.5
                        for even_numbers in $(seq $first $second)
                        do
                                if (($even_numbers%2==0))
                                then
                                        echo "Even number --> $even_numbers"
                                else
                                        continue
                                fi
                        done
                elif [ "$option" == "odd" ]
                then
                        echo "Displaying odd numbers"
                        sleep 0.5
                        for odd_numbers in $(seq $first $second)
                        do
                                if (($odd_numbers%2!=0))
                                then
                                        echo "Odd number --> $odd_numbers"
                                else
                                        continue
                                fi
                        done
                else
                        echo "Issues with the user input"
                fi

        elif [ $first -eq $second ]
        then
                echo "First number is equal to second"
                echo "Cannot do anything"
        elif [ $first -gt $second ]
        then
                echo "Second number is greater than second"
                echo "Cannot do anything"
        else
                echo "Something went wrong" 
        fi

fi
