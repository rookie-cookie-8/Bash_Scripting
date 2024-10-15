#basic script, ask user for numbers and are used in sequence. 
#Based upon the user input, it display even or odd numbers within the specified range
#first number must be smaller than second, else error is display if the first number is greater than second

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
        elif [ -z "$first" ] && [ -n "$second" ]
        then
                echo "First number field is empty"
        else
                echo "Issues with the user input"
        fi
elif [ -n "$first" ] && [ -n "$second" ]
then
        echo "********************************************"
        echo "Would you like to print even or odd number"
        read option

        if [ "$option" == "even" ] 
        then
                if [ $first -lt $second ]
                then
                        for even_numbers in $(seq $first $second)
                        do
                                if (($even_numbers%2==0))
                                then
                                        echo "Number is --> $even_numbers"
                                else
                                        continue
                                fi
                        done
                else
                        echo "First number cannot be grater than second"
                fi
        elif [ "$option" == "odd" ] 
        then
                if [ $first -lt $second ]
                then
                        for odd_numbers in $(seq $first $second)
                        do
                                if (($odd_numbers%2!=0))
                                then
                                        echo "Number is --> $odd_numbers"
                                else
                                        continue
                                fi

                        done
                else
                        echo "First number cannot be greater than second"
                fi
        else
                echo "Invalid option"
        fi

fi

---------------------------------------------------------------------------------------------------------------------------------------------------------------
#!/bin/bash

echo "Enter the first number"
read first
echo "Enter the second number"
read second

function first_check {
        [[ $first =~ ^[0-9]+$ ]]
}
function second_check {
        [[ $second =~ ^[0-9]+$ ]]
}
function first_wrong {
        [[ ! $first =~ ^[0-9]+$ ]]
}
function second_wrong {
        [[ ! $second =~ ^[0-9]+$ ]]
}

if [ -z "$first" ] || [ -z "$second" ]
then
        if [ -n "$first" ] && [ -z "$second" ]
        then
                echo "********************************"
                echo "Second number field is empty"
        elif [ -z "$first" ] && [ -n "$second" ]
        then
                echo "********************************"
                echo "First number field is empty"
        elif [ -z "$first" ] && [ -z "$second" ]
        then
                echo "********************************"
                echo "First number field is empty"
                echo "Second number field is empty"
        else
                echo "********************************"
                echo "Issues with the user input"
        fi
elif [ -n "$first" ] && [ -n "$second" ]
then
        if first_wrong || second_wrong
        then
                if first_check && second_wrong
                then
                        echo "******************************"
                        echo "Second number field can only contain numeric digits"
                elif first_wrong && second_check
                then
                        echo "******************************"
                        echo "First number field can only contain numeric digits"
                elif first_wrong && second_wrong
                then
                        echo "******************************"
                        echo "First number field can only contain numeric digits"
                        echo "Second number field can only contain numeric digits"
                else
                        echo "******************************"
                        echo "Some issues while check user input"
                fi
        elif first_check && second_check
        then
                if [ $first -lt $second ]
                then
                        echo "****************************************"
                        echo "Would you like to print even or odd numbers"
                        read option
                        if [ "$option" == "even" ]
                        then
                                for even_number in $(seq $first $second)
                                do
                                        if (($even_number%2==0))
                                        then
                                                echo "Even number is --> $even_number"
                                                sleep 0.5
                                        else
                                                continue
                                        fi
                                done
                        elif [ "$option" == "odd" ]
                        then
                                for odd_number in $(seq $first $second)
                                do
                                        if (($odd_number%2!=0))
                                        then
                                                echo "Even number is --> $odd_number"
                                                sleep 0.5
                                        else
                                                continue
                                        fi
                                done
                        else
                                echo "**************************************"
                                echo "Invalid user input"
                        fi
                elif [ $first -eq $second ]
                then
                        echo "*****************************"
                        echo "First number is equal to second number"
                        echo "Cannot do anything"
                elif [ $first -gt $second ]
                then
                        echo "*****************************"
                        echo "First number is greater than second number"
                        echo "Cannot do anything"
                fi
        fi
fi
------------------------------------------------------------------------------------------------------------------------------------------------------------
#!/bin/bash

echo "Enter the first number"
read first
echo "Enter the second number"
read second

function first_right {
        [[ $first =~ [0-9]+$ ]]
}
function first_wrong {
        [[ ! $first =~ [0-9]+$ ]]
}
function second_right {
        [[ $second =~ [0-9]+$ ]]
}
function second_wrong {
        [[ ! $second =~ [0-9]+$ ]]
}


if [ -z "$first" ] || [ -z "$second" ]
then
        if [ -n "$first" ] && [ -z "$second" ]
        then
                echo "**********************************"
                echo "Second number field is empty"
        elif [ -z "$first" ] && [ -n "$second" ]
        then
                echo "**********************************"
                echo "First number field is empty"
        elif [ -z "$first" ] && [ -z "$second" ]
        then
                echo "**********************************"
                echo "First number field is empty"
                echo "Second number field is empty"
        else
                echo "**********************************"
                echo "Issues with the user input"
        fi
elif [ -n "$first" ] && [ -n "$second" ]
then
        if first_wrong || second_wrong
        then
                if first_right && second_wrong
                then
                        echo "***************************************"
                        echo "Second number field must contain only digits"
                elif first_wrong && second_right
                then
                        echo "***************************************"
                        echo "First number field must contain only digits"
                elif first_wrong && second_wrong
                then
                        echo "***************************************"
                        echo "First number field must contain only digits"
                        echo "Second number field must contain only digits"
                else
                        echo "***************************************"
                        echo "Issues with user input validation"
                fi
        elif first_right && second_right
        then
                if [ $first -lt $second ]
                then
                        echo "*****************************************"
                        echo "Would you like to print even or odd numbers"
                        read option
                        if [ "$option" == "even" ]
                        then
                                for even_numbers in $(seq $first $second)
                                do
                                        if (($even_numbers%2==0))
                                        then
                                                echo "Number is $even_numbers"
                                                sleep 0.5
                                        else
                                                continue
                                        fi

                                done
                        elif [ "$option" == "odd" ]
                        then
                                for odd_numbers in $(seq $first $second)
                                do
                                        if (($odd_numbers%2!=0))
                                        then
                                                echo "Number is $odd_numbers"
                                                sleep 0.5
                                        else
                                                continue
                                        fi
                                done

                        else
                                echo "**************************************"
                                echo "Invalid user option"
                        fi
                elif [ $first -gt $second ]
                then
                        echo "***********************************"
                        echo "Would you like to print even or odd numbers"
                        read option
                        if [ "$option" == "even" ]
                        then
                                for even_numbers in $(seq $second $first)
                                do
                                        if (($even_numbers%2==0))
                                        then
                                                echo "Number is $even_numbers"
                                                sleep 0.5
                                        else
                                                continue
                                        fi

                                done
                        elif [ "$option" == "odd" ]
                        then
                                for odd_numbers in $(seq $second $first)
                                do
                                        if (($odd_numbers%2!=0))
                                        then
                                                echo "Number is $odd_numbers"
                                                sleep 0.5
                                        else
                                                continue
                                        fi
                                done
                        fi

                elif [ $first -eq $second ]
                then
                        echo "***********************************"
                        echo "First number cannot be equal to second"
                else
                        echo "***********************************"
                        echo "Issues with checking numbers"
                fi
        fi
fi
----------------------------------------------------------------------------------------------------------------------------------------------------

#!/bin/bash

echo "Enter the first number"
read first
echo "Enter the second number"
read second

function first_right {
        [[ $first =~ ^[0-9]+$ ]]
}
function second_right {
        [[ $second =~ ^[0-9]+$ ]]
}
function first_wrong {
        [[ ! $first =~ ^[0-9]+$ ]]
}
function second_wrong {
        [[ ! $second =~ ^[0-9]+$ ]]
}
function first_right_range {
        [[ $first =~ ^[0-9]{1,2}$ ]]
}
function second_right_range {
        [[ $second =~ ^[0-9]{1,2}$ ]]
}
function first_wrong_range {
        [[ ! $first =~ ^[0-9]{1,2}$ ]]
}
function second_wrong_range {
        [[ ! $second =~ ^[0-9]{1,2}$ ]]
}


if [ -z "$first" ] || [ -z "$second" ]
then
        if [ -n "$first" ] && [ -z "$second" ]
        then
                echo "************************************"
                echo "Second number field is empty"
        elif [ -z "$first" ] && [ -n "$second" ]
        then
                echo "************************************"
                echo "First number field is empty"
        elif [ -z "$first" ] && [ -z "$second" ]
        then
                echo "************************************"
                echo "First number field is empty"
                echo "Second number field is empty"
        else
                echo "************************************"
                echo "Issues with the user input"
        fi

elif [ -n "$first" ] && [ -n "$second" ]
then
        if first_wrong || second_wrong
        then
                if first_right && second_wrong
                then
                        echo "****************************************"
                        echo "Second number field must contain only digits"
                elif first_wrong && second_right
                then
                        echo "****************************************"
                        echo "First number field must contain only digits"
                elif first_wrong && second_wrong
                then
                        echo "****************************************"
                        echo "First number field must contain only digits"
                        echo "Second number field must contain only digits"
                else
                        echo "****************************************"
                        echo "Issues with the user input"
                fi
        elif first_right && second_right
        then
                if first_wrong_range || second_wrong_range
                then
                        if first_right_range && second_wrong_range
                        then
                                echo "***************************************"
                                echo "Second number field must contain max 2 digits"
                        elif first_wrong_range && second_right_range
                        then
                                echo "***************************************"
                                echo "First number field must contain max 2 digits"
                        elif first_wrong_range && second_wrong_range
                        then
                                echo "***************************************"
                                echo "First number field must contain max 2 digits"
                                echo "Second number field must contain max 2 digits"
                        else
                                echo "***************************************"
                                echo "Issues with the user input validation"
                        fi
                elif first_right_range && second_right_range
                then
                        if [ $first -lt $second ]
                        then
                                echo "*******************************************"
                                echo "Would you like to print even / odd numbers"
                                read choice
                                if [ "$choice" == "even" ]
                                then
                                        for even_numbers in $(seq $first $second)
                                        do
                                                if(($even_numbers%2==0))
                                                then
                                                        echo "****Even number --> $even_numbers*****"
                                                        sleep 0.5
                                                else
                                                        sleep 0.5
                                                        continue
                                                fi
                                        done
                                elif [ "$choice" == "odd" ]
                                then
                                        for odd_numbers in $(seq $first $second)
                                        do
                                                if(($odd_numbers%2!=0))
                                                then
                                                        echo "****Odd number --> $odd_numbers*****"
                                                        sleep 0.5
                                                else
                                                        sleep 0.5
                                                        continue
                                                fi
                                        done
                                else
                                        echo "**************************************"
                                        echo "Invalid user input"
                                fi
                        elif [ $first -eq $second ]
                        then
                                echo "**************************************"
                                echo "$first is equal to $second"
                                echo "Nothing can be done"
                        elif [ $first -gt $second ]
                        then
                                echo "**************************************"
                                echo "$first is greather than $second"
                                echo "Nothing can be done"
                        fi

                fi
        fi
fi


