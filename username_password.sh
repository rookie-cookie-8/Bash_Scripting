#authentication username and password. 

#!/bin/bash

function user_input {
        echo "Enter the username"
        read username
        echo "Enter the password"
        read password
}

function validation_1 {
        if [ -z "$username" ] || [ -z "$password" ]
        then
                if [ -z "$username" ] && [ -n "$password" ]
                then
                        echo "Uername field empty"
                        try_again
                elif [ -n "$username" ] && [ -z "$password" ]
                then
                        echo "Password field empty"
                        try_again
                else
                        echo "Issues with the user input"
                        try_again
                fi
        fi
}
function validation_2 {
        if [ -n "$username" ] && [ -n "$password" ]
        then
                if [ "$username" == "admin" ] && [ "$password" == "pass" ]
                then
                        echo "********************************"
                        echo "Success"
                else
                        echo "********************************"
                        echo "Incorrect login details"
                        try_again
                fi
        fi
}
function try_again {
        echo "Would you like to try again. Y/y or N/n"
        read option
        if [ "$option" == "Y" ] || [ "$option" == "y" ]
        then
                user_input
                validation_1
                validation_2
        elif [ "$option" == "N" ] || [ "$option" == "n" ]
        then
                echo "Bye"
        else
                echo "Invalid option"
        fi
}



user_input
validation_1
validation_2
