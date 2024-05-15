#two numbers as input from the user
#script checks condition
#if all ok, the script ask user to print even or odd numbers
# based upon the user input i.e. odd or even, the numbers are displayed. 

#!/bin/bash

echo "Enter the start number"
read start_number
echo "Enter the stop number"
read stop_number
if [ -z "$start_number" ] || [ -z "$stop_number" ]
then
        if [ -n "$start_number" ] && [ -z "$stop_number" ]
        then
                echo "***************************************"
                echo "Stop number field is empty"
                echo "***************************************"
        elif [ -z "$start_number" ] && [ -n "$stop_number" ]
        then
                echo "***************************************"
                echo "Start number field is empty"
                echo "***************************************"
        else
                echo "***************************************"
                echo "Issues with the user input"
                echo "***************************************"
        fi
elif [ -n "$start_number" ] && [ -n "$stop_number" ]
then
        if [ $stop_number -gt $start_number ]
        then
                echo "*****************************************"
                echo "Would you like to print odd or even numbers ?"
                read option
                if [ "$option" == "odd" ] || [ "$option" == "ODD" ]
                then
                        for numbers in $(seq $start_number $stop_number)
                        do
                                if (($numbers%2!=0))
                                then
                                        echo "**********************************"
                                        echo "Odd number --> $numbers"
                                else
                                        continue
                                fi
                        done
                elif [ "$option" == "even" ] || [ "$option" == "EVEN" ]
                then
                        for numbers in $(seq $start_number $stop_number)
                        do
                                if (($numbers%2==0))
                                then
                                        echo "**********************************"
                                        echo "Even number --> $numbers"
                                else
                                        continue
                                fi
                        done
                else
                        echo "*****************************************"
                        echo "Invalid user input"
                        echo "*****************************************"
                fi
        else
                echo "************************************"
                echo "Stop number -> $stop_number is less than start_number -> $start_number"
                echo "Nothing to do"
                echo "************************************"
        fi
fi
