#script for oscp exercise for attempting zone file transfer
#can also automate the script with the help of for loop. 

#!/bin/bash

echo "Enter the domain name such as new.com"
read domain 

if [ -z "$domain" ]
then
        echo "User input empty"
else
        echo "*****************************"
        echo "Looking for Name Servers" 
        host -t ns $domain | cut -d " " -f4
        echo "*****************************"
        echo "Would you like, zone file transfer, Y or N" 
        read choice
        if [ "$choice" == "Y" ] || [ "$choice" == "y" ]
        then
                echo "Enter the name server"
                read name_server
                echo "***************************"
                host -l $domain $name_server
        else
                echo "Bye for now"
        fi

fi
------------------------------------------------------------------------------------------------------------------------------------------------------------
#!/bin/bash


echo "Enter the domain name"
read domain

if [ -z "$domain" ]
then
        echo "*******************************"
        echo "Domain field is empty"
else
        echo "*******Looking for DNS servers********"
        sleep 0.3
        host -t ns $domain &>/dev/null
        if [ $? -eq 0 ]
        then
                echo "*******Name Servers found*********"
                sleep 0.3
                host -t ns $domain | cut -d " " -f4 > ./name-servers
                sleep 0.3
                echo "Would you like to do a zone file transfer y/n"
                read choice
                if [ "$choice" == "y" ]
                then
                        for zone_transfer in $(cat ./name-servers)
                        do
                                host -l $domain $zone_transfer &>/dev/null
                                if [ $? -eq 0 ]
                                then
                                        echo "*******$zone_transfer Done********"
                                        host -l $domain $zone_transfer

                                else
                                        echo "*******$zone_transfer failed********"
                                        sleep 0.5
                                        continue
                                fi
                        done
                elif [ "$choice" == "n" ]
                then
                        echo "*******No zone file tarnsfer conducted as per user request********"
                else
                        echo "********Invalid user input***********"
                fi
        else
                echo "**********************************"
                echo "Name servers not found"
        fi
fi
rm -rf ./1
rm -rf ./name-servers

