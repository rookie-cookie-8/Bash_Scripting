#ask the user to enter the filepath and filename
#the script whether the filepath and filename is valid or not
#if it is valid, specifiy its a directory or a file and display the permissions 

#!/bin/bash

echo "Enter the file path"
read filepath
echo "Enter the filename"
read filename

if [ -z "$filepath" ] || [ -z "$filename" ]
then
        if [ -n "$filepath" ] && [ -z "$filename" ]
        then
                echo "Filename field is empty"
        elif [ -z "$filepath" ] && [ -n "$filename" ]
        then
                echo "Filepath field is empty"
        else
                echo "Issues with the username"
        fi

elif [ -n "$filepath" ] && [ -n "$filename" ]
then
        if [ -e $filepath$filename ]
        then
                if [ -d $filepath$filename ]
                then
                        echo "***************Its a directory************"
                        echo "*****Lets check the permission***********"
                        sleep 0.2
                        if [ ! -r $filepath$filename ] && [ ! -w $filepath$filename ] && [ ! -x $filepath$filename ] 
                        then
                                echo "No RWX permission"
                        elif [ ! -r $filepath$filename ] && [ ! -w $filepath$filename ] && [ -x $filepath$filename ]                                                    
                        then                                                        
                                echo "Execute permission"                           
                                echo "No RW permission"
                        elif [ ! -r $filepath$filename ] && [ -w $filepath$filename ] && [ ! -x $filepath$filename ] 
                        then
                                echo "Write permission"
                                echo "No RX permission"
                        elif [ ! -r $filepath$filename ] && [ -w $filepath$filename ] && [ -x $filepath$filename ] 
                        then
                                echo "Write and Excute permission"
                                echo "No R permission"
                        elif [ -r $filepath$filename ] && [ ! -w $filepath$filename ] && [ ! -x $filepath$filename ] 
                        then
                                echo "Read permission"
                                echo "No WX permission"
                        elif [ -r $filepath$filename ] && [ ! -w $filepath$filename ] && [ -x $filepath$filename ] 
                        then
                                echo "Read and Execute permission"
                                echo "No W permission"
                        elif [ -r $filepath$filename ] && [ -w $filepath$filename ] && [ ! -x $filepath$filename ] 
                        then
                                echo "Read and Write permission"
                                echo "No X permission"
                        elif [ -r $filepath$filename ] && [ -w $filepath$filename ] && [ -x $filepath$filename ] 
                        then
                                echo "Read,Write and Execute permission"
                        fi
                elif [ -f $filepath$filename ]
                then
                        echo "***************Its a File************"
                        echo "*****Lets check the permission***********"
                        sleep 0.2
                        if [ ! -r $filepath$filename ] && [ ! -w $filepath$filename ] && [ ! -x $filepath$filename ] 
                        then
                                echo "No RWX permission"
                        elif [ ! -r $filepath$filename ] && [ ! -w $filepath$filename ] && [ -x $filepath$filename ] 
                        then
                                echo "Execute permission"
                                echo "No RW permission"
                        elif [ ! -r $filepath$filename ] && [ -w $filepath$filename ] && [ ! -x $filepath$filename ] 
                        then
                                echo "Write permission"
                                echo "No RX permission"
                        elif [ ! -r $filepath$filename ] && [ -w $filepath$filename ] && [ -x $filepath$filename ] 
                        then
                                echo "Write and Excute permission"
                                echo "No R permission"
                        elif [ -r $filepath$filename ] && [ ! -w $filepath$filename ] && [ ! -x $filepath$filename ] 
                        then
                                echo "Read permission"
                                echo "No WX permission"
                        elif [ -r $filepath$filename ] && [ ! -w $filepath$filename ] && [ -x $filepath$filename ] 
                        then
                                echo "Read and Execute permission"
                                echo "No W permission"
                        elif [ -r $filepath$filename ] && [ ! -w $filepath$filename ] && [ -x $filepath$filename ] 
                        then
                                echo "Read and Execute permission"
                                echo "No W permission"
                        elif [ -r $filepath$filename ] && [ -w $filepath$filename ] && [ ! -x $filepath$filename ] 
                        then
                                echo "Read and Write permission"
                                echo "No X permission"
                        elif [ -r $filepath$filename ] && [ -w $filepath$filename ] && [ -x $filepath$filename ] 
                        then
                                echo "Read,Write and Execute permission"
                        fi
                else
                        echo "**********************************"
                        echo "Unable to identify the file type"
                fi
        else
                echo "************************************"
                echo "Incorrect filename or filepath"
        fi
fi
