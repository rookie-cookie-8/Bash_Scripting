#Brute force attack on the domain in order to find out different hostname

#!/bin/bash

echo "Enter the domain name i.e. google.com"
read domain
echo "Enter the file for the brute force"
read filename

if [ -z "$domain" ] || [ -z "$filename" ]
then
        if [ -n "$domain" ] && [ -z "$filename" ]
        then
                echo "***************************************"
                echo "Filename field is empty"
                echo "***************************************"
        elif [ -z "$domain" ] && [ -n "$filename" ]
        then
                echo "***************************************"
                echo "Domain name field is empty"
                echo "***************************************"
        else
                echo "***************************************"
                echo "Issues with the user input"
                echo "***************************************"
        fi
elif [ -n "$domain" ] && [ -n "$filename" ]
then
        if [ -f $filename ]
        then
                for domain_name in $(cat $filename)
                do
                        host $domain_name.$domain 1>/dev/null
                        if [ $? -eq 0 ]
                        then
                                echo "**************************************"
                                host $domain_name.$domain | cut -d " " -f1,4
                                sleep 0.2
                        else
                                echo "**************************************"
                                echo "$domain_name.$domain --> Public DNS records not found"
                                sleep 0.2
                                continue
                        fi

                done
        else
                echo "***************************************"
                echo "File not found"
                echo "***************************************"
        fi
fi
