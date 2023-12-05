#oscp exercise, to find out multiple hostname belongs to the domain

#!/bin/bash

echo "Enter the wordlist file location"
read wordlist_file

echo "ENter the domain i.e google.com"
read domain

if [ -z "$wordlist_file" ] || [ -z "$domain" ]
then

        if [ -n "$wordlist_file" ] && [ -z "$domain" ]
        then
                echo "Domain field empty"
        elif [ -z "$wordlist_file" ] && [ -n "$domain" ]
        then
                echo "file field empty"
        else
                echo "SOmething wrong with the user input"
        fi
elif [ -n "$wordlist_file" ] && [ -n "$domain" ]
then
        if [ -f $wordlist_file ]
        then
                for names in $(cat $wordlist_file)
                do
                        host $names.$domain | grep "has address" | cut -d " " -f1,4 2>/dev/null
                        sleep 0.1
                done
        else
                echo "File not found"
        fi
fi
