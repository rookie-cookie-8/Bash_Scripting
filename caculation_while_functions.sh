#calucation bash script with functions 

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
                        echo "**************************************"
                        echo "Second number field is empty"
                        try_again
                elif [ -z "$first" ] && [ -n "$second" ]
                then
                        echo "**************************************"
                        echo "First number field is empty"
                        try_again
                else
                        echo "**************************************"
                        echo "Issues with the user input"
                        try_again
                fi
        fi
}
function validation_2 {
        if [ -n "$first" ] && [ -n "$second" ]
        then
                echo "**************************************************"
                echo "Press 1 --> Addition"
                echo "Press 2 --> Subtraction"
                echo "Press 3 --> Multiplication"
                echo "Press 4 --> Power"
                read user_option
                if [ "$user_option" == "1" ]
                then
                        echo "******************************************"
                        ans=$((first+second))
                        echo "$first plus $second --> $ans"
                        echo "******************************************"
                        try_again
                elif [ "$user_option" == "2" ]
                then
                        echo "******************************************"
                        ans=$((first-second))
                        echo "$first minus $second --> $ans"
                        echo "******************************************"
                        try_again
                elif [ "$user_option" == "3" ]
                then
                        echo "******************************************"
                        ans=$((first*second))
                        echo "$first multiply $second --> $ans"
                        echo "******************************************"
                        try_again
                elif [ "$user_option" == "4" ]
                then
                        echo "******************************************"
                        ans=$((first**second))
                        echo "$first power $second --> $ans"
                        echo "******************************************"
                        try_again
                else
                        echo "******************************************"
                        echo "Invalid user input"
                        try_again
                fi
        fi
}
function try_again {
        echo "**********************************************"
        echo "Would you like to try again"
        read answer
        if [ "$answer" == "Y" ] || [ "$answer" == "y" ]
        then
                user_input
                validation_1
                validation_2
        elif [ "$answer" == "N" ] || [ "$answer" == "n" ]
        then
                echo "**********************************************"
                echo "Bye"
                exit
        else
                echo "**********************************************"
                echo "Invalid user option"
                exit
        fi
}

user_input
validation_1
validation_2

user_input
validation_1
validation_2

--------------------------------------------------------------------------------------------------------------------------------------------
#!/bin/bash
#advanced with functions 

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
                        echo "***********************************"
                        echo "Second number field is empty"
                        try_again
                elif [ -z "$first" ] && [ -n "$second" ]
                then
                        echo "***********************************"
                        echo "First number field is empty"
                        try_again
                elif [ -z "$first" ] && [ -z "$second" ]
                then
                        echo "***********************************"
                        echo "First number field is empty"
                        echo "Second number field is empty"
                        try_again
                else
                        echo "***********************************"
                        echo "Issues with the user input"
                        try_again
                fi
        fi
}
function first_right {
        [[ $first =~ ^[0-9-]+$ ]]
}
function first_wrong {
        [[ ! $first =~ ^[0-9-]+$ ]]
}
function second_right {
        [[ $second =~ ^[0-9-]+$ ]]
}
function second_wrong {
        [[ ! $second =~ ^[0-9-]+$ ]]
}

function calculation {
        echo "*************************************"
        echo "Press 1 --> Addition"
        echo "Press 2 --> Subtraction"
        echo "Press 3 --> Multiplication"
        echo "Press 4 --> Power"
        read option
        if [ "$option" == "1" ]
        then
                echo "**********************************"
                ans=$(($first+$second))
                echo "$first plus $second --> $ans"
                try_again
        elif [ "$option" == "2" ]
        then
                echo "**********************************"
                ans=$(($first-$second))
                echo "$first minus $second --> $ans"
                try_again
        elif [ "$option" == "3" ]
        then
                echo "**********************************"
                ans=$(($first*$second))
                echo "$first multiply $second --> $ans"
                try_again
        elif [ "$option" == "4" ]
        then
                echo "**********************************"
                ans=$(($first**$second))
                echo "$first power $second --> $ans"
                try_again
        else
                echo "**********************************"
                echo "Invalid user input"
                try_again
        fi
}

function validation_2 {
        if [ -n "$first" ] && [ -n "$second" ]
        then
                if first_wrong || second_wrong
                then
                        if first_right && second_wrong
                        then
                                echo "********************************"
                                echo "Second number field must contain digits"
                                try_again
                        elif first_wrong && second_right
                        then
                                echo "********************************"
                                echo "First number field must contain digits"
                                try_again
                        elif first_wrong && second_wrong
                        then
                                echo "********************************"
                                echo "First number field must contain digits"
                                echo "Second number field must contain digits"
                                try_again
                        else
                                echo "********************************"
                                echo "Issues with the user input validation"
                                try_again
                        fi
                elif first_right && second_right
                then
                        calculation
                fi
        fi
}
function try_again {
        echo "*********************************************"
        echo "Would you like to try again y/n ?"
        read answer
        if [ "$answer" == "y" ]
        then
                user_input
                validation_1
                validation_2
        elif [ "$answer" == "n" ]
        then
                echo "*********************************************"
                echo "You choose to quit"
                exit
        else
                echo "*********************************************"
                echo "Invalid, bye"
        fi
}


user_input
validation_1
validation_2

--------------------------------------------------------------------------------------------------------------------------------------------------------------------
#calculation such as add, subtract, multiply and power
#user input must not be greather than 3 positive numbers 

#!/bin/bash

function user_input {
        echo "Enter the first number"
        read first
        echo "Enter the second number"
        read second
}

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
        [[ $first =~ ^[0-9]{1,3}$ ]]
}
function second_right_range {
        [[ $second =~ ^[0-9]{1,3}$ ]]
}
function first_wrong_range {
        [[ ! $first =~ ^[0-9]{1,3}$ ]]
}
function second_wrong_range {
        [[ ! $second =~ ^[0-9]{1,3}$ ]]
}

function validation_1 {

        if [ -z "$first" ] || [ -z "$second" ]
        then
                if [ -n "$first" ] && [ -z "$second" ]
                then
                        echo "*************************************"
                        echo "Second number field is empty"
                        try_again
                elif [ -z "$first" ] && [ -n "$second" ]
                then
                        echo "*************************************"
                        echo "First number field is empty"
                        try_again
                elif [ -z "$first" ] && [ -z "$second" ]
                then
                        echo "*************************************"
                        echo "First number field is empty"
                        echo "Second number field is empty"
                        try_again
                else
                        echo "*************************************"
                        echo "Issues with the user input"
                        try_again
                fi
        fi
}

function validation_2 {

        if [ -n "$first" ] && [ -n "$second" ]
        then
                if first_wrong || second_wrong
                then
                        if first_right && second_wrong
                        then
                                echo "**************************************"
                                echo "Second field must contain only digits"
                                try_again
                        elif first_wrong && second_right
                        then
                                echo "**************************************"
                                echo "First field must contain only digits"
                                try_again
                        elif first_wrong && second_wrong
                        then
                                echo "**************************************"
                                echo "First field must contain only digits"
                                echo "Second field must contain only digits"
                                try_again
                        else
                                echo "**************************************"
                                echo "Issues with the user input validation"
                                try_again
                        fi
                elif first_right && second_right
                then
                        if first_wrong_range || second_wrong_range
                        then
                                if first_right_range && second_wrong_range
                                then
                                        echo "****************************************"
                                        echo "Second number field must contain max 3 digits"
                                        try_again
                                elif first_wrong_range && second_right_range
                                then
                                        echo "****************************************"
                                        echo "First number field must contain max 3 digits"
                                        try_again
                                elif first_wrong_range && second_wrong_range
                                then
                                        echo "****************************************"
                                        echo "First number field must contain max 3 digits"
                                        echo "Second number field must contain max 3 digits"
                                        try_again
                                else
                                        echo "****************************************"
                                        echo "Issues with user input numbers validation"
                                        try_again
                                fi
                        elif first_right_range && second_right_range
                        then
                                calculation
                        fi
                fi
        fi
}

function calculation {
        echo "**********************************************"
        echo "Press 1 --> Addition"
        echo "Press 3 --> Subtraction"
        echo "Press 3 --> Multiplication"
        echo "Press 4 --> Power"
        read choice
        if [ $choice == "1" ]
        then
                ans=$(($first+$second))
                echo "$first plus $second --> $ans"
                try_again
        elif [ $choice == "2" ]
        then
                ans=$(($first-$second))
                echo "$first minus $second --> $ans"
                try_again
        elif [ $choice == "3" ]
        then
                ans=$(($first*$second))
                echo "$first multiply $second --> $ans"
                try_again
        elif [ $choice == "4" ]
        then
                ans=$(($first**$second))
                echo "$first power $second --> $ans"
                try_again
        else
                echo "Invalid user input"
                try_again
        fi
}


function try_again {
        echo "*****************************************"
        echo "Would you like to try again y/n"
        read answer
        if [ "$answer" == "y" ]
        then
                user_input
                validation_1
                validation_2
        elif [ "$answer" == "n" ]
        then
                echo "*****************************************"
                echo "You choose to quit, bye"
        else
                echo "*****************************************"
                echo "Invalid user input, bye"
        fi
}

user_input
validation_1
validation_2

