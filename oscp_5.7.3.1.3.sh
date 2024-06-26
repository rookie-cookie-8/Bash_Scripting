#oscp exercise looking for javascript files

#!/bin/bash

echo "Enter the filepath"
read filepath

if [ -z "$filepath" ]
then
        echo "************************************"
        echo "File path field is empty"
        echo "************************************"
else
        if [ -e $filepath ]
        then
                if [ -f $filepath ]
                then
                        cat $filepath | grep -i ".js" | cut -d "/" -f5 | sort | uniq | cut -d " " -f1 > ./javascript-files
                        echo "************************************"
                        if [ -s ./javascript-files ]
                        then
                                echo "******Javascript files found******"
                                cat ./javascript-files
                        else
                                echo "******No Javascript files found******"
                        fi
                elif [ -d $filepath ]
                then
                        echo "************************************"
                        echo "Its a directory, nothing to do"
                        echo "************************************"
                else
                        echo "************************************"
                        echo "Unable to identify the file type"
                        echo "************************************"
                fi
        else
                echo "******Invalid file path**************"
        fi

fi
rm -rf ./1
rm -rf ./javascript-files
