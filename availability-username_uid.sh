#Allows the username to enter the username and uid. 
#script helps to check whether the username and uid is available or not. 

#!/bin/bash

echo "Enter the username"
read username

echo "Enter uid"
read uid

if [ -z "$username" ] || [ -z "$uid" ]
then
        if [ -n "$username" ] && [ -z "$uid" ]
        then
                echo "UID field empty"
        elif [ -z "$username" ] && [ -n "$uid" ]
        then
                echo "Username field empty"
        else
                echo "Soemthing wrong with user input"
        fi

elif [ -n "$username" ] && [ -n "$uid" ]
then
        cat /etc/passwd | cut -d ":" -f1 | grep -i "$username" > ./username-list
        cat /etc/passwd | cut -d ":" -f3 | grep -i "$uid" > ./uid-list
        if [ -f ./username-list ] && [ -f ./uid-list ]
        then
                if [ -s ./username-list ] && [ -s ./uid-list ]
                then
                        echo "Username not available"
                        echo "uid not available"
                elif [ ! -s ./username-list ] && [ -s ./uid-list ]
                then
                        echo "Username available"
                        echo "uid not avilable"
                elif [ ! -s ./uid-list ] && [ -s ./username-list ]
                then
                        echo "uid available"
                        echo "username not avilable"
                else
                        echo "Username available"
                        echo "uid available"
                fi

        fi
fi
rm -rf ./username-list
rm -rf ./uid-list
