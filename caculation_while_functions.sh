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
                        echo "************************************"
                        echo "Second number field is empty"
                        do_it_again
                elif [ -z "$first" ] && [ -n "$second" ]
                then
                        echo "************************************"
                        echo "First number field is empty"
                        do_it_again
                elif [ -z "$first" ] && [ -z "$second" ]
                then
                        echo "************************************"
                        echo "First number field is empty"
                        echo "Second number field is empty"
                        do_it_again
                else
                        echo "************************************"
                        echo "Issues with the user input"
                        do_it_again
                fi
        fi
}
function first_check {
        [[ "$first" =~ ^-?[0-9]+$ ]]
}
function second_check {
        [[ "$second" =~ ^-?[0-9]+$ ]]
}
function first_wrong {
        [[ ! "$first" =~ ^-?[0-9]+$ ]]
}
function second_wrong {
        [[ ! "$second" =~ ^-?[0-9]+$ ]]
}

function user_choice {
        echo "******************************************"
        echo "Press 1 for addition"
        echo "Press 2 for Subtraction"
        echo "Press 3 for Multiplier"
        echo "Press 4 for Power"
        read option
        if [[ "$option" =~ ^[0-4]+$ ]]
        then
                if [ "$option" == "1" ]
                then
                        echo "*****************************"
                        ans=$((first+second))
                        echo "$first plus $second --> $ans"
                        do_it_again
                elif [ "$option" == "2" ]
                then
                        echo "*****************************"
                        ans=$((first-second))
                        echo "$first minus $second --> $ans"
                        do_it_again
                elif [ "$option" == "3" ]
                then
                        echo "*****************************"
                        ans=$((first*second))
                        echo "$first multiply $second --> $ans"
                        do_it_again
                elif [ "$option" == "4" ]
                then
                        echo "*****************************"
                        ans=$((first**second))
                        echo "$first power $second --> $ans"
                        do_it_again
                fi
        else
                echo "**************************************"
                echo "invalid user choice"
        fi
}
function do_it_again {
        echo "**********************************************"
        echo "Would you like to try again y/Y or N/n?"
        read answer
        if [ "$answer" == "Y" ] || [ "$answer" == "y" ]
        then
                user_input
                validation_1
                validation_2
        elif [ "$answer" == "N" ] || [ "$answer" == "n" ]
        then
                echo "********************************"
                echo "You choose to quit bye"
        else
                echo "********************************"
                echo "Invalid user answer, Bye"
        fi
}

function validation_2 {
        if [ -n "$first" ] && [ -n "$second" ]
        then
                if first_wrong || second_wrong
                then
                        if first_check && second_wrong
                        then
                                echo "***************************"
                                echo "Second number field can only contain numeric digits"
                                do_it_again
                        elif first_wrong && second_check
                        then
                                echo "***************************"
                                echo "First number field can only contain numeric digits"
                                do_it_again
                        elif first_wrong && second_wrong
                        then
                                echo "***************************"
                                echo "First number field can only contain numeric digits"
                                echo "Second number field can only contain numeric digits"
                                do_it_again
                        else
                                echo "***************************"
                                echo "Went wrong with user input validation"
                                do_it_again
                        fi
                elif first_check && second_check
                then
                        user_choice
                fi
        fi
}

user_input
validation_1
validation_2
