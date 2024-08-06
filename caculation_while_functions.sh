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
                        echo "*************************************"
                        echo "Second number field empty"
                elif [ -z "$first" ] && [ -n "$second" ]
                then
                        echo "*************************************"
                        echo "First number field empty"
                elif [ -z "$first" ] && [ -z "$second" ]
                then
                        echo "*************************************"
                        echo "First number field empty"
                        echo "Second number field empty"
                else
                        echo "*************************************"
                        echo "Issues with the user input"
                fi
        fi
}
function validation_2 {
        if [ -n "$first" ] && [ -n "$second" ]
        then
                if [[ "$first" =~ ^[0-9-]+$ ]] && [[ "$second" =~ ^[0-9-]+$ ]]
                then
                        echo "***************************************************"
                        echo "Press 1 --> Addition"
                        echo "Press 2 --> Subtraction"
                        echo "Press 3 --> Multiplication"
                        echo "Press 4 --> Power"
                        read option
                        if [ "$option" == "1" ]
                        then
                                echo "**********************************"
                                ans=$((first+second))
                                echo "$first plus $second --> $ans"
                        elif [ "$option" == "2" ]
                        then
                                echo "**********************************"
                                ans=$((first-second))
                                echo "$first subtract $second --> $ans"
                        elif [ "$option" == "3" ]
                        then
                                echo "**********************************"
                                ans=$((first*second))
                                echo "$first multiply $second --> $ans"
                        elif [ "$option" == "4" ]
                        then
                                echo "**********************************"
                                ans=$((first**second))
                                echo "$first power $second --> $ans"
                        else
                                echo "**********************************"
                                echo "Invalid user input"
                        fi
                elif [[ ! "$first" =~ ^[0-9]+$ ]] || [[ ! "$second" =~ ^[0-9]+$ ]]
                then
                        if [[ "$first" =~ ^[0-9]+$ ]] && [[ ! "$second" =~ ^[0-9]+$ ]]
                        then
                                echo "***************************************"
                                echo "Second number field can only contain numeric digits"
                        elif [[ ! "$first" =~ ^[0-9]+$ ]] && [[ "$second" =~ ^[0-9]+$ ]]
                        then
                                echo "***************************************"
                                echo "First number field can only contain numeric digits"
                        elif [[ ! "$first" =~ ^[0-9]+$ ]] && [[ ! "$second" =~ ^[0-9]+$ ]]
                        then
                                echo "***************************************"
                                echo "First number field can only contain numeric digits"
                                echo "Second number field can only contain numeric digits"
                        fi
                fi
        fi
}



user_input
validation_1
validation_2

