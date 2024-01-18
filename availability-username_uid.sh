#Allows the username to enter the username and uid. 
#script helps to check whether the username and uid is available or not. 

#!/bin/bash

echo "Enter the username"
read username
echo "ENter the UID"
read uid 

if [ -z "$username" ] || [ -z "$uid" ]
then
        if [ -n "$username" ] && [ -z "$uid" ]
        then
                echo "UID field empty"
        elif [ -z "$username" ] && [ -n "$uid" ]
        then
                echo "username field empty"
        else
                echo "Both field empty"
        fi
elif [ -n "$username" ] && [ -n "$uid" ]
then
        cat /etc/passwd | grep -i "$username" | cut -d ":" -f1 > ./username_lists
        cat /etc/passwd | grep -i "$uid" | cut -d ":" -f3 > ./uid_lists
        echo "**********************************************"
        if [ ! -s ./username_lists ] && [ ! -s ./uid_lists ]
        then
                echo "Username --> $username is available"
                echo "UID --> $uid is available"
        elif [ -s ./username_lists ] && [ ! -s ./uid_lists ]
        then
                echo "Username --> $username is not available"
                echo "UID --> $uid is available"
        elif [ ! -s ./username_lists ] && [ -s ./uid_lists ]
        then
                echo "Username --> $username is available"
                echo "UID --> $uid is not available"
        elif [ -s ./username_lists ] && [ -s ./uid_lists ]
        then
                echo "Username --> $username is not available"
                echo "UID --> $uid is not available"
        fi

fi
rm -rf ./1
rm -rf ./username_lists
rm -rf ./uid_lists
