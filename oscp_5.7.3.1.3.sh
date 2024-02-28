#oscp exercise looking for javascript files

#!/bin/bash

echo "Enter the file path"
read path
echo "Enter the filename"
read file

if [ -z "$path" ] || [ -z "$file" ]
then
        if [ -n "$path" ] && [ -z "$file" ]
        then
                echo "File field not found"
        elif [ -z "$path" ] && [ -n "$file" ]
        then
                echo "Path field not found"
        else
                echo "Issues with the user input"
        fi
elif [ -n "$path" ] && [ -n "$file" ]
then
        if [ -e $path$file ]
        then
                if [ -f $path$file ]
                then
                        cat $path$file | grep -i ".js" | cut -d "/" -f5 | sort | uniq > ./javascript_files
                        if [ -s ./javascript_files ]
                        then
                                echo "*****************************************"
                                echo "File found"
                                echo "*****************************************"
                                cat ./javascript_files
                                echo "*****************************************"
                        else
                                echo "No javascript files"
                        fi
                else
                        echo "No file found"
                fi
        else
                echo "*******************************************"
                echo "Invalid file path"
        fi
fi
rm -rf ./1
rm -rf ./javascript_files

