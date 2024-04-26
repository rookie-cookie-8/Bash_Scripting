# username and uid number as input from the user.
#script check whether the username and uid number is available or not. 

#!/bin/bash

echo "Enter the username"
read username
echo "Enter the uid number"
read uid

if [ -z "$username" ] || [ -z "$uid" ]
then
        if [ -n "$username" ] && [ -z "$uid" ]
        then
                echo "UID field is empty"
        elif [ -z "$username" ] && [ -n "$uid" ]
        then
                echo "Username field is empty"
        else
                echo "Issus with the user input"
        fi

elif [ -n "$username" ] && [ -n "$uid" ]
then
        cat /etc/passwd | cut -d ":" -f1 | grep -i "$username" > ./username_list
        cat /etc/passwd | cut -d ":" -f3 | grep -i "$uid" > ./uid_list
        if [ ! -s ./username_list ] && [ ! -s ./uid_list ]
        then
                echo "***********************************************"
                echo "Username is available --> $username"
                echo "UID is available --> $uid"
                echo "***********************************************"
        elif [ -s ./username_list ] && [ ! -s ./uid_list ]
        then
                echo "***********************************************"
                echo "Username is not available --> $username"
                echo "UID is available --> $uid"
                echo "***********************************************"
        elif [ ! -s ./username_list ] && [ -s ./uid_list ]
        then
                echo "***********************************************"
                echo "Username is available --> $username"
                echo "UID is not available --> $uid"
                echo "***********************************************"
        elif [ -s ./username_list ] && [ -s ./uid_list ]
        then
                echo "***********************************************"
                echo "Username is not available --> $username"
                echo "UID is not available --> $uid"
                echo "***********************************************"
        else
                echo "***********************************************"
                echo "SOmething went wrong"
        fi
fi
rm -rf ./username_list
rm -rf ./uid_list
rm -rf ./1
