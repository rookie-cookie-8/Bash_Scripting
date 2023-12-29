#!/bin/bash

function user_input {
        echo "Enter the username"
        read username
        echo "Enter the password"
        read password
        echo "*******************************************"
}

function validation_1 {
        if [ -z "$username" ] || [ -z "$password" ]
        then
                if [ -n "$username" ] && [ -z "$password" ]
                then
                        echo "Password field is empty"
                        again
                elif [ -z "$username" ] && [ -n "$password" ]
                then
                        echo "Username field is empty"
                        again
                else
                        echo "Both the user input field is empty"
                        again
                fi
        fi
        }

function validation_2 {
        if [ -n "$username" ] && [ -n "$password" ]
        then
                if [ "$username" == "admin" ] && [ "$password" == "password" ]
                then
                        echo "Login success"
                else
                        echo "Invalid credentials"
                        echo "*******************************************"
                        again

                fi
        fi
}
function again {
        echo "***********************************************************************"
        echo "Invalid credentials or user input missing, would like like to go again. Y/y or N/n"
        read option
        if [ "$option" == "Y" ] || [ "$option" == "y" ]
        then
                user_input
                validation_1
                validation_2
        elif [ "$option" == "N" ] || [ "$option" == "n" ]
        then
                echo "Press NO, so bye for now"
        else
                echo "Invalid response from the user, so exiting"
        fi
}


user_input
validation_1
validation_2
