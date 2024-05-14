#username and uid_number input from the user
#script tells whether the username and the uid_number is available for the next use. 

#!/bin/bash
echo "Enter the username"
read username
echo "Enter the uid number"
read uid_number

if [ -z "$username" ] || [ -z "$uid_number" ]
then
        if [ -n "$username" ] && [ -z "$uid_number" ]
        then
                echo "UID number field is empty"
        elif [ -z "$username" ] && [ -n "$uid_number" ]
        then
                echo "Username field is empty"
        else
                echo "Issues with the user input"
        fi
elif [ -n "$username" ] && [ -n "$uid_number" ]
then
        cat /etc/passwd | grep -i "$username" | cut -d ":" -f1 > ./username_lists
        cat /etc/passwd | grep -i "$uid_number" | cut -d ":" -f3 > ./uid_lists
        if [ ! -s ./username_lists ] && [ ! -s ./uid_lists ]
        then
                echo "********************************************"
                echo "Username is available --> $username"
                echo "UID is available --> $uid_number"
                echo "********************************************"
        elif [ -s ./username_lists ] && [ ! -s ./uid_lists ]
        then
                echo "********************************************"
                echo "Username is not available --> $username"
                echo "UID is available --> $uid_number"
                echo "********************************************"
        elif [ ! -s ./username_lists ] && [ -s ./uid_lists ]
        then
                echo "********************************************"
                echo "Username is available --> $username"
                echo "UID is not available --> $uid_number"
                echo "********************************************"
        elif [ -s ./username_lists ] && [ -s ./uid_lists ]
        then
                echo "********************************************"
                echo "Username is not available --> $username"
                echo "UID is not available --> $uid_number"
                echo "********************************************"
        else
                echo "********************************************"
                echo "Snomething went wrong"
                echo "********************************************"
        fi
fi
rm -rf ./1
rm -rf ./username_lists
rm -rf ./uid_lists
