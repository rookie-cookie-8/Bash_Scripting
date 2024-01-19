#basic script, ask user for numbers and are used in sequence. 
#Based upon the user input, it display even or odd numbers within the specified range

!/bin/bash

echo "Enter the first number"
read first

echo "Enter the second number"
read second 

if [ -z "$first" ] || [ -z "$second" ]
then
        if [ -n "$first" ] && [ -z "$second" ]
        then
                echo "Second number field is empty"
        elif [ -n "$second" ] && [ -z "$first" ]
        then
                echo "First number field is empty"
        else
                echo "Issues with the user input"
        fi

elif [ -n "$first" ] && [ -n "$second" ]
then
        echo "************************************************"
        echo "Would you like to print even or odd number: E/e or O/o"
        read option
        echo "************************************************"
        if [ "$option" == "e" ] || [ "$option" == "E" ]
        then
                for even_number in $(seq $first $second)
                do
                        if (($even_number%2==0))
                        then
                                echo "Even number is: $even_number"
                        else
                                continue
                        fi
                done
        elif [ "$option" == "o" ] || [ "$option" == "O" ]
        then
                for odd_number in $(seq $first $second)
                do
                        if (($odd_number%2!=0))
                        then
                                echo "Odd number is: $odd_number"
                        else
                                continue
                        fi
                done
        else
                echo "Invalid option, bye"
        fi

fi
