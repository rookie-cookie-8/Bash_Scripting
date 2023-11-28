#authentication. Still got some bugs

#!/bin/bash

user_input(){
        echo "Enter the username"
        read username
        echo "Enter the password"
        read password
        echo "***************************************"
}


user_input_check(){
        if [ -z "$username" ] || [ -z "$password" ]
        then
                if [ -n "$username" ] && [ -z "$password" ]
                then
                        echo "Password field is empty"
                elif [ -z "$username" ] && [ -n "$password" ]
                then
                        echo "Username field is empty"
                else
                        echo "Something wrong with the user input"
                fi
        fi
}

authentication(){
        if [ -n "$username" ] && [ -n "$password" ]
        then
                if [ "$username" == "admin" ] && [ "$password" == "pass" ]
                then
                        echo "Login success"
                        exit
                else
                        echo "Incorrect login credentials"
                        echo "Would you like to continue Y/y or N/n"
                        read choice
                        if [ "$choice" == "Y" ] || [ "$choice" == "y" ]
                        then
                                again
                        else
                                echo "Bye"
                                exit
                        fi
                fi
        fi
}
again(){
        login_attempt=0
        while [ $login_attempt -lt 4 ]
        do
                user_input
                user_input_check
                authentication
                ((login_attempt++))

        done
}

user_input
user_input_check
authentication
