#brute force attack on the domain to find sub-domains / different hostnames
# file: /usr/share/seclists/Discovery/DNS/subdomains-top1million-5000.txt

#!/bin/bash

echo "Enter the domain name i.e. domain.com"
read domain
echo "Enter the filepath for brute force"
read filepath

if [ -z "$domain" ] || [ -z "$filepath" ]
then
        if [ -n "$domain" ] && [ -z "$filepath" ]
        then
                echo "Filepath field is empty"
        elif [ -z "$domain" ] && [ -n "$filepath" ]
        then
                echo "Domain field is empty"
        else
                echo "Issues with the user input"
        fi
elif [ -n "$domain" ] && [ -n "$filepath" ]
then
        if [ -e $filepath ]
        then
                if [ -f $filepath ]
                then
                        echo "********************************************"
                        echo "Will start brute force attack on $domain"
                        sleep 2

                        for host_name in $(cat $filepath)
                        do
                                host $host_name.$domain > /dev/null
                                if [ $? -eq 0 ]
                                then
                                        echo "********************************************"
                                        host $host_name.$domain 
                                        sleep 0.2
                                        continue
                                        echo "********************************************"
                                elif [ $? -eq 1 ]
                                then
                                        echo "********************************************"
                                        echo "$host_name.$domain invalid"
                                        sleep 0.2
                                        continue
                                        echo "********************************************"
                                else
                                        echo "Something went wrong with $filepath.$domain"
                                fi
                        done

                elif [ -d $filepath ]
                then
                        echo "********************************"
                        echo "Its a directory, cant do anything"
                else
                        echo "Unable to identify the file type"
                fi
        else
                echo "********************************"
                echo "File not found"
        fi
fi
