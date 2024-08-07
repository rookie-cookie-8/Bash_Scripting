#basic calculation

#!/bin/bash

echo "Enter the first number"
read first
echo "Enter the second number"
read second 

if [ -z "$first" ] || [ -z "$second" ]
then
        if [ -z "$first" ] && [ -n "$second" ]
        then
                echo "First number field is empty"
        elif [ -n "$first" ] && [ -z "$second" ]
        then
                echo "Second number field is empty"
        else
                echo "Both number field is empty"
        fi

elif [ -n "$first" ] && [ -n "$second" ]
then
        echo "**************************************"
        echo "First number is: $first"
        echo "Second number is: $second"
        echo "**************************************"
        echo "Press 1 --> Addition"
        echo "Press 2 --> Subtraction"
        echo "Press 3 --> Multiplication"
        echo "Press 5 --> Power"
        echo "Press 5 --> Remainder"
        echo "Press 6 --> Quotient"
        read option
        echo "***********************************************"
        if [ "$option" == "1" ]
        then
                ans=$((first+second))
                echo "$first + $second --> $ans"
        elif [ "$option" == "2" ]
        then
                ans=$((first-second))
                echo "$first - $second --> $ans"
        elif [ "$option" == "3" ]
        then
                ans=$((first*second))
                echo "$first * $second --> $ans"
        elif [ "$option" == "4" ]
        then
                ans=$((first**second))
                echo "$first power $second --> $ans"
        elif [ "$option" == "5" ]
        then
                ans=$((first%second))
                echo "$first % $second --> $ans"
        elif [ "$option" == "6" ]
        then
                ans=$((first/second))
                echo "$first / $second --> $ans"
        fi
fi
-----------------------------------------------------------------------------------------------------------------------------------------------------------
#advanced with functions
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
function first_check_false {
        [[ ! $first =~ ^[0-9]+$ ]]
}
function second_check_false {
        [[ ! $second =~ ^[0-9]+$ ]]
}

if [ -z "$first" ] || [ -z "$second" ]
then
        if [ -n "$first" ] && [ -z "$second" ]
        then
                echo "******************************************"
                echo "Second number field is empty"
        elif [ -z "$first" ] && [ -n "$second" ]
        then
                echo "******************************************"
                echo "First number field is empty"
        elif [ -z "$first" ] && [ -z "$second" ]
        then
                echo "******************************************"
                echo "First number field is empty"
                echo "Second number field is empty"
        else
                echo "******************************************"
                echo "Issues with the user input"
        fi
elif [ -n "$first" ] && [ -n "$second" ]
then
        if first_check && second_check
        then
                echo "*****************************************"
                echo "Press 1 --> Addition"
                echo "Press 2 --> Subtraction"
                echo "Press 3 --> Multiplication"
                echo "Press 4 --> Power"
                read option
                if [ "$option" == "1" ]
                then
                        ans=$((first+second))
                        echo "***********************************"
                        echo "$first plus $second --> $ans"
                elif [ "$option" == "2" ]
                then
                        ans=$((first-second))
                        echo "***********************************"
                        echo "$first minus $second --> $ans"
                elif [ "$option" == "3" ]
                then
                        ans=$((first*second))
                        echo "***********************************"
                        echo "$first multiply $second --> $ans"
                elif [ "$option" == "4" ]
                then
                        ans=$((first**second))
                        echo "***********************************"
                        echo "$first power $second --> $ans"
                else
                        echo "***********************************"
                        echo "Invalid user input"
                fi
        elif first_check_false || second_check_false
        then
                if first_check && second_check_false
                then
                        echo "**************************************"
                        echo "Second number field can only contain numeric digits"
                elif first_check_false && second_check
                then
                        echo "**************************************"
                        echo "First number field can only contain numeric digits"
                elif first_check_false && second_check_false
                then
                        echo "**************************************"
                        echo "First number field can only contain numeric digits"
                        echo "Second number field can only contain numeric digits"
                else
                        echo "**************************************"
                        echo "Something went wrong"
                fi
        fi
fi
