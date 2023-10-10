#script: basic strings 
# -n: Non empty, -z: Empty, " " == " " --> Strings equal, " " != " " --> String not equal


#!/bin/bash

echo "Enter username"
read username

read -sp "Enter password: " password
echo

if [ -z "$username" ] || [ -z "$password" ]
then
        if [ -n "$username" ] && [ -z "$password" ]
        then
                echo "Password field empty"
        elif [ -z "$username" ] && [ -n "$password" ]
        then
                echo "Username field empty"
        else
                echo "User input missing"
        fi

elif [ -n "$username" ] && [ -n "$password" ]
then
        if [ "$username" == "admin" ] && [ "$password" == "pass" ]
        then
                echo "Login success"
        else
                echo "Issue with user credentials"
        fi

fi
