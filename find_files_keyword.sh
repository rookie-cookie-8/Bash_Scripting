#script -> User can enter file location and keyword. 
#Script will check whether the user specified keyword exist within the file or not. 

#!/bin/bash

echo "Enter the full file path"
read file
echo "Enter the keyword"
read keyword

if [ -z "$file" ] || [ -z "$keyword" ]
then
        if [ -z "$file" ] && [ -n "$keyword" ]
        then
                echo "Path field empty"
        elif [ -n "$file" ] && [ -z "$keyword" ]
        then
                echo "Keyword field empty"
        else
                echo "Soemthing wrong with user input"
        fi

elif [ -n "$keyword" ] && [ -n "$file" ]
then
        if [ -s $file ]
        then
                cat $file | grep -i $keyword 1>output
                if [ -s ./output ]
                then
                        echo "*****************"
                        cat output
                else
                        echo "Keyword not found"
                fi
        else
                echo "File not found"
        fi

fi
rm -rf ./output
