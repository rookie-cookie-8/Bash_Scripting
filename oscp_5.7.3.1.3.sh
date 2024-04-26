#oscp exercise looking for javascript files

#!/bin/bash

echo "Enter the file path"
read filepath

if [ -z "$filepath" ]
then
        echo "File path field empty"
else
        if [ -e $filepath ]
        then
                if [ -d $filepath ]
                then
                        echo "Its a directory"
                elif [ -f $filepath ]
                then
                        cat $filepath | grep -i ".js" | cut -d "/" -f5 | sort | uniq > javascript_files
                        if [ -s ./javascript_files ]
                        then
                                echo "****************************"
                                cat ./javascript_files
                        else
                                echo "Unable to find Javascript files"
                        fi
                else
                        echo "Unable to identify file type"
                fi
        else
                echo "Unable to locate file"
        fi
fi
rm -rf ./1
rm -rf ./javascript_files


