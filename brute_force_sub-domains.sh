#Brute force attack on the domain in order to find out different hostname

#!/bin/bash

echo "******Brute force to find sub-domains********"
sleep 0.5
echo "Enter the domain i.e. google.com"
read domain
echo "Enter the file for brute force"
read file

if [ -z "$domain" ] || [ -z "$file" ]
then
        if [ -n "$domain" ] && [ -z "$file" ]
        then
                echo "*****************************"
                echo "File path field is empty"
        elif [ -z "$domain" ] && [ -n "$file" ]
        then
                echo "*****************************"
                echo "Domain name field is empty"
        elif [ -z "$domain" ] && [ -z "$file" ]
        then
                echo "*****************************"
                echo "Domain name field is empty"
                echo "File path field is empty"
        else
                echo "*****************************"
                echo "Something went wrong"
        fi
elif [ -n "$domain" ] && [ -n "$file" ]
then
        if [ -e $file ]
        then
                if [ -d $file ]
                then
                        echo "************************************"
                        echo "Its a directory, nothing can be done"
                elif [ -s $file ]
                then
                        for hostnames in $(cat $file)
                        do
                                host $hostnames.$domain &>/dev/null
                                if [ $? -eq 0 ]
                                then
                                        echo "************************************"
                                        host $hostnames.$domain | cut -d " " -f1,4
                                        host $hostnames.$domain | cut -d " " -f1,4 >> sub-domains
                                        sleep 0.5
                                else
                                        echo "************************************"
                                        echo "$hostnames.$domain not found"
                                        sleep 0.5
                                        continue
                                fi
                        done
                else
                        echo "************************************"
                        echo "Something went wrong"
                fi
        else
                echo "***************************"
                echo "File not found"
        fi
fi
rm -rf ./1
