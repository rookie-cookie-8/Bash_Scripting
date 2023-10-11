#brute force to find out hostnames related to domain 

#!/bin/bash

echo "ENter the domain i.e. new.com"
read domain 

echo "Enter the wordlist filepath"
read file

if [ -z "$domain" ] || [ -z "$file" ]
then
        if [ -n "$domain" ] && [ -z "$file" ]
        then
                echo "File path field empty"
        elif [ -z "$domain" ] && [ -n "$file" ]
        then
                echo "Domain field empty"
        else
                echo "SOmething wrong with user input"
        fi
elif [ -n "$domain" ] && [ -n "$file" ]
then
        if [ -s $file ]
        then
                for sub_domains in $(cat $file)
                do
                        host $sub_domains.$domain | grep -i "has address" | cut -d " " -f1,4 2>/dev/null
                done
        else
                echo "File not found"
        fi

fi
