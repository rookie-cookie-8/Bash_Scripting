#!/bin/bash

echo "Enter the domain i.e. google.com"
read domain
echo "Enter the path for brute force to discover sub-domains"
read file


if [ -z "$domain" ] || [ -z "$file" ]
then
        if [ -n "$domain" ] && [ -z "$file" ]
        then
                echo "*************************************"
                echo "File path field is empty"
        elif [ -z "$domain" ] && [ -n "$file" ]
        then
                echo "*************************************"
                echo "Domain field is empty"
        elif [ -z "$domain" ] && [ -z "$file" ]
        then
                echo "*************************************"
                echo "Domain field is empty"
                echo "File path field is empty"
        else
                echo "*************************************"
                echo "Issues with the user input"
        fi
elif [ -n "$domain" ] && [ -n "$file" ]
then
        if [ -e $file ]
        then
                if [ -f $file ] && [ -s $file ]
                then
                        for sub_domains in $(cat $file)
                        do
                                host $sub_domains.$domain &>/dev/null
                                if [ $? -eq 0 ]
                                then
                                        echo "**************************************"
                                        host $sub_domains.$domain | cut -d " " -f1,4 | awk '{print $1 " --> " $2}'
                                        sleep 0.5
                                else
                                        echo "**************************************"
                                        echo "$sub_domains.$domain not found"
                                        sleep 0.5
                                fi

                        done
                elif [ -d $file ]
                then
                        echo "****************************************"
                        echo "Its a directory"
                else
                        echo "****************************************"
                        echo "Unable to identify the file type"
                fi

        else
                echo "****************************************"
                echo "Invalid file location"
        fi
fi
