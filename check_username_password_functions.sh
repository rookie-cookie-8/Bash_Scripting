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
                if [ -n "$username" ] && [ -z "$password" ]
                then
                        echo "password field is empty"
                        try_again
                elif [ -z "$username" ] && [ -n "$password" ]
                then
                        echo "username field is empty"
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
                checking
        fi
}
function checking {
        if [ "$username" == "admin" ] && [ "$password" == "password" ]
        then
                echo "*******************************"
                echo "Login success"
        else
                echo "*******************************"
                echo "Incorrect login credentials"
                try_again
        fi
}
function try_again {
        echo "Would you like to try again Y/y or N/n"
        read option
        if [ "$option" == "Y" ] || [ "$option" == "y" ]
        then
                user_input
                validation_1
                validation_2
        elif [ "$option" == "N" ] || [ "$option" == "n" ]
        then
                echo "Bye for now"
        else
                echo "Invalid user input option"
                echo "Quiting, bye"
        fi
}
user_input
validation_1
validation_2
------------------------------------------------------------------------------------------------------------------------------------------
#does require some improvement
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
                if [ -n "$username" ] && [ -z "$password" ]
                then
                        echo "password field is empty"
                        try_again
                        do_it_again
                elif [ -z "$username" ] && [ -n "$password" ]
                then
                        echo "username field is empty"
                        try_again
                        do_it_again
                else
                        echo "Issues with the user input"
                        try_again
                        do_it_again
                fi
        fi
}
function validation_2 {
        if [ -n "$username" ] && [ -n "$password" ]
        then
                checking
        fi
}
function checking {
        if [ "$username" == "admin" ] && [ "$password" == "password" ]
        then
                echo "*******************************"
                echo "Login success"
                exit
        else
                echo "*******************************"
                echo "Incorrect login credentials"
                try_again
                do_it_again
        fi
}
function try_again {
        echo "Would you like to try again Y/y or N/n"
        read option
        if [ "$option" == "Y" ] || [ "$option" == "y" ]
        then
                user_input
                validation_1
                validation_2
                do_it_again
        elif [ "$option" == "N" ] || [ "$option" == "n" ]
        then
                echo "Bye for now"
                exit
        else
                echo "Invalid user input option"
                echo "Quiting, bye"
                exit
        fi
}
function do_it_again {
        count=0 
        while [ $count -lt 3 ]
        do
                user_input
                validation_1
                validation_2
                ((count++))
        done
}
user_input
validation_1
validation_2

