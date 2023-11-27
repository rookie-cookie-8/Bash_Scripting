#this script for written for oscp exercise, looking for javascript files
#!/bin/bash

echo "Enter the file location"
read file_location

if [ -z "$file_location" ]
then
        echo "User input missing"
else
        if [ -f $file_location ]
        then
                echo "***************************************************"
                echo "Looking for Javascript files: .js"
                echo "***************************************************"
                cat $file_location | cut -d "/" -f5 | grep -i ".js" | sort | uniq | cut -d " " -f1 > ./javascript_files
                if [ -s ./javascript_files ]
                then
                        echo "Javascript files found"
                        cat ./javascript_files
                else
                        echo "No javascript files found"
                fi
        else
                echo "File not found"
        fi

fi
rm -rf ./1
rm -rf ./javascript_files
