#script created for oscp exercise to look / find javascript files 
#!/bin/bash

#user input, Enter the absolute path
echo "Enter the file path"
read path

#user input, enter the filename
echo "Enter the file name"
read filename

#condition check of the user input.
if [ -z "$path" ] || [ -z "$filename" ]
then
        if [ -z "$path" ] && [ -n "$filename" ]
        then
                echo "Path field empty"
        elif [ -n "$path" ] && [ -z "$filename" ]
        then
                echo "Filename field empty"
        else
                echo "User input field missing"
        fi
#user input OK. 
elif [ -n "$path" ] && [ -n "$filename" ]
then
        # If the file exists, and the file size is greater than 0 bytes
        if [ -s $path$filenme ]
        then
                echo "***************************************"
                echo "Looking for Javascript files in $path$filename "

                #file found and looking for javascript files. If found, the output will be saved inside a file i.e. javascript-files
                cat $path$filename | grep -i ".js" | cut -d "/" -f5 | cut -d " " -f1 | sort | uniq > /home/kali/bash-scripts/javascript_files
                
                # If the file exists, and the file size is greater than 0 bytes
                if [ -s /home/kali/bash-scripts/javascript_files ]
                then
                        #user input, ask whether the user would like to view the file contents or not. 
                        echo "Would you like to view the file contents. Y/y or N/n"
                        read choice

                        #If user would like to view the file contents, than the files which are found will be displayed
                        if [ "$choice" == "Y" ] || [ "$choice" == "y" ]
                        then
                                cat /home/kali/bash-scripts/javascript_files
                        else

                                #User would not like to view the file contents, so exit the script. 
                                echo "Bye for now"
                        fi
                fi
        else

                #User input, If user entered invalid file path or does not exist
                echo "File doesnt exist or invalid path"
        fi

fi

#Delete the file which were created within the script
rm -rf /home/kali/bash-scripts/javascript_files
rm -rf /home/kali/bash-scripts/1
