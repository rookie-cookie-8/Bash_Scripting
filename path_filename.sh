#Script: Helps the user to identify the filetype such as empty file, directory, regular file or something else
#!/bin/bash

echo "Enter the file Path"
read path
echo "Enter the file name"
read filename

if [ -z "$path" ] || [ -z "$filename" ]
then
        if [ -n "$path" ] && [ -z "$filename" ]
        then
                echo "Filename field not empty"
        elif [ -z "$path" ] && [ -n "$filename" ]
        then
                echo "Path field not empty"
        else
                echo "Something wrong with user input"
        fi

elif [ -n "$path" ] && [ -n "$filename" ]
then
        if [ -e $path$filename ]
        then
                if [ -d $path$filename ]
                then
                        echo "Its a directory"
                elif [ -s $path$filename ]
                then
                        if [ ! -s $path$filename ]
                        then
                                echo "Its a empty file"
                        else

                                echo "Its a regular file"
                        fi
                else
                        echo "It is something, cannot recognize"
                fi
        else
                echo "No file found"
        fi
fi
