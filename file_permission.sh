#script to check whether file or directory exist or not. 
#If file or directory exist, display the permissions


#!/bin/bash

echo "Enter the path"
read path

echo "Enter the filename"
read filename


if [ -z "$path" ] || [ -z "$filename" ]
then
        if [ -n "$path" ] && [ -z "$filename" ]
        then
                echo "Filename field empty"
        elif [ -z "$path" ] && [ -n "$filename" ]
        then
                echo "Path field empty"
        else
                echo "Both field empty"

        fi
elif [ -n "$path" ] && [ -n "$filename" ]
then
        if [ -e "$path$filename" ]
        then
                if [ -d "$path$filename" ]
                then
                        if [ -x "$path$filename" ] && ( ! [ -r "$path$filename" ] && ! [ -w "$path$filename" ] )
                        then
                                echo "Its a directory with execute permission"
                                echo "No rw permission"
                        elif [ -w "$path$filename" ] && ( ! [ -r "$path$filename" ] && ! [ -x "$path$filename" ] )
                        then
                                echo "Its a directory with write permission"
                                echo "No rx permission"
                        elif [ ! -r "$path$filename" ] && ( [ -w "$path$filename" ] && [ -x "$path$filename" ] )
                        then
                                echo "Its a directory with write and excute permission"
                                echo "No r permission"
                        elif [ -r "$path$filename" ] && ( ! [ -w "$path$filename" ] && ! [ -x "$path$filename" ] )
                        then
                                echo "Its a directory read permission"
                                echo "No wx permission"
                        elif [ ! -w "$path$filename" ] && ( [ -r "$path$filename" ] && [ -x "$path$filename" ] )
                        then
                                echo "Its a directory with read and excute permission"
                                echo "No w permission"
                        elif [ ! -x "$path$filename" ] && ( [ -r "$path$filename" ] && [ -w "$path$filename" ] )
                        then
                                echo "Its a directory with read and write permission"
                                echo "No x permission"
                        elif [ -r "$path$filename" ] && [ -w "$path$filename" ] && [ -x "$path$filename" ]
                        then
                                echo "Its a directory with full permission"
                        else
                                echo "Its a directory with no permission"
                        fi
                elif [ -f "$path$filename" ]
                then
                        if [ -x "$path$filename" ] && ( ! [ -r "$path$filename" ] && ! [ -w "$path$filename" ] )
                        then
                                echo "Its a regular file with excute permission"
                                echo "No read and write permission"
                        elif [ -w "$path$filename" ] && ( ! [ -r "$path$filename" ] && ! [ -x "$path$filename" ] )
                        then
                                echo "Its a regular file with write permission"
                                echo "No read and excute permission"
                        elif [ ! -r "$path$filename" ] && ( [ -w "$path$filename" ] && [ -x "$path$filename" ] )
                        then
                                echo "Its a regular file with write  and excute permission"
                                echo "No read permission"
                        elif [ -r "$path$filename" ] && ( ! [ -w "$path$filename" ] && ! [ -x "$path$filename" ] )
                        then
                                echo "Its a regular file with read permission"
                                echo "No wx permission"
                        elif [ ! -w "$path$filename" ] && ( [ -r "$path$filename" ] && [ -x "$path$filename" ] )
                        then
                                echo "Its a regular file with read and excute permission"
                                echo "No w permission"
                        elif [ ! -x "$path$filename" ] && ( [ -r "$path$filename" ] && [ -w "$path$filename" ] )
                        then
                                echo "Its a regular file with read and excute  permission"
                                echo "No w permission"
                        elif [ ! -x "$path$filename" ] && ( [ -r "$path$filename" ] && [ -w "$path$filename" ] )
                        then
                                echo "Its a regular file with read and write  permission"
                                echo "No x permission"
                        elif [ -r "$path$filename" ] && [ -w "$path$filename" ] && [ -x "$path$filename" ]
                        then
                                echo "Its a regular file with all permission"
                        else
                                echo "Its a regular file with no permission"


                        fi
                else
                        echo "Cannot recognize the file"
                fi
        else
                echo "No file found"
        fi
fi
