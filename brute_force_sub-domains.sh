#brute force attack on the domain to find sub-domains / different hostnames
# file: /usr/share/seclists/Discovery/DNS/subdomains-top1million-5000.txt

#!/bin/bash

echo "Enter the domain name i.e. google.com"
read domain_name 
echo "Enter the filepath for brute force"
read filepath

if [ -z "$domain_name" ] || [ -z "$filepath" ]
then
        if [ -n "$domain_name" ] && [ -z "$filepath" ]
        then
                echo "Filepath field is empty"
        elif [ -z "$domain_name" ] && [ -n "$filepath" ]
        then
                echo "Domain name field is empty"
        else
                echo "Issues with the user input"
        fi

elif [ -n "$domain_name" ] && [ -n "$filepath" ]
then
        if [ -f $filepath ]
        then
                for hostnames in $(cat $filepath)
                do
                        host $hostnames.$domain_name  &>/dev/null 
                        if [ $? -eq 0 ]
                        then
                                echo "-----------------------------------"
                                echo "$hostnames.$domain_name found"
                                host $hostnames.$domain_name
                                continue
                        else
                                echo "-----------------------------------"
                                echo "$hostnames.$domain_name does not exists"
                                sleep 0.5
                                continue
                        fi
                done                                                               
        else                                                                       
                echo "-------------------------------------"                       
                echo "File not found"                                              
        fi                                                                         
                                                                                   
fi
