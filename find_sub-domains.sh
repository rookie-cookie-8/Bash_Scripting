#Script, user enter domain name and brute force hostname list 
# This script helps to find sub-domains 


#!/bin/bash

echo "Enter the domain name"
read domain

echo "Brute force sub-domains list"
read file

if [ -z "$domain" ] || [ -z "$file" ]
then
        if [ -n "$domain" ] && [ -z "$file" ]
        then
                echo "File field empty"
        elif [ -z "$domain" ] && [ -n "$file" ]
        then
                echo "Domain field empty"
        else
                echo "Something wrong with user input"
        fi

elif [ -n "$domain" ] && [ -n "$file" ]
then
        if [ -s $file ]
        then
                echo "**********************************************"
                for sub_domains in $(cat $file)
                do
                        host $sub_domains.$domain | grep -i "has address" | cut -d " " -f1,4 2>/dev/null
                done
        else
                echo "File not found, Quit"
        fi

fi

