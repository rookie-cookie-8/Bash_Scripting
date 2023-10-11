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
