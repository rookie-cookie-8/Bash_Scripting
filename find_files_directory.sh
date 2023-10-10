#script takes user input as path to start, look for regular files or directories, modified in last how many days  

#!/bin/bash

echo "Enter the Path i.e. start searching files from"
read path

echo "Would you like to find files or Directory i.e. f or d"
read find

echo "Enter the modified number of days"
read days

if [ -z "$path" ] ||  [ -z "$find" ] || [ -z "$days" ]
then
        if [ -z "$path" ] && ( [ -n "$find" ] && [ -n "$days" ] )
        then
                echo "Path field empty"
        elif [ -z "$find" ] && ( [ -n "$path" ] && [ -n "$days" ] )
        then
                echo "Find field empty"
        elif [ -z "$days" ] && ( [ -n "$path" ] && [ -n "$find" ] )
        then
                echo "Days field empty"
        else
                echo "Something wrong with user input"
        fi

elif [ -n "$path" ] && [ -n "$find" ] && [ -n "$days" ]
then
        echo "Looking for $find, modified in last $days starting from $path directory path"
        find $path -type $find -mtime -$days 2>/dev/null 1>output
        cat output
fi
rm -rf ./output
