#oscp exercise, to find out multiple hostname belongs to the domain
#apt install -y seclists
#file location for most comman hostname: /usr/share/seclists/Discovery/DNS/
#!/bin/bash

echo "Enter the domain name i.e. google.com"
read domain
echo "Enter the filename for brute force"
read file

if [ -z "$domain" ] ||  [ -z "$file" ]
then
        if [ -z "$domain" ] && [ -n "$file" ]
        then
                echo "*****************************************"
                echo "Domain input field is empty"
        elif [ -n "$domain" ] && [ -z "$file" ]
        then
                echo "*****************************************"
                echo "File input field is empty"
        else
                echo "*****************************************"
                echo "SOmething wrong with the user input"
        fi
elif [ -n "$domain" ] && [ -n "$file" ]
then
        if [ -f "$file" ]
        then
                for names in $(cat $file) 
                do
                        host -t a $names.$domain | grep -i "has address" | cut -d " " -f1,4 2>/dev/null
                        sleep 0.2

                done
        else
                echo "Invalid file path"
        fi


fi
        fi
fi
