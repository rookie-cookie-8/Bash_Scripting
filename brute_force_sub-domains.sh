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
---------------------------------------------------------------------------------------------------------------------------------
#!/bin/bash

echo "Enter the domain name i.e. google.com"
read domain 
echo "Enter the sub-domains file path"
read file_path

if [ -z "$domain" ] || [ -z "$file_path" ]
then
        if [ -n "$domain" ] && [ -z "$file_path" ]
        then
                echo "File path field is empty"
        elif [ -z "$domain" ] && [ -n "$file_path" ]
        then
                echo "Domain field is empty"
        else
                echo "Issues with the user input"
        fi
elif [ -n "$domain" ] && [ -n "$file_path" ]
then
        if [ -f "$file_path" ] && [ -s "$file_path" ]
        then
                test=1
                for sub_domains in $(cat $file_path)
                do
                        echo "************************************"
                        echo "Testing $test"
                        host $sub_domains.$domain | grep -i "has address" | cut -d " " -f1
                        ((test++))

                done
        else
                echo "File not found"
        fi
fi
---------------------------------------------------------------------------------------------------------------------------------

