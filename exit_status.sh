#basic script to check the exit status of the last command 
#!/bin/bash

echo "Enter the name of the directory" 
read directory

if [ -z "$directory" ]
then
        echo "Name of the directory is missing"
else
        echo "-----------------------------------"
        mkdir abc 2>/dev/null 
        if [ "$?" -eq 0 ]
        then
                echo "Directory $directory created"
        else
                echo "Soemthing went wrong"
        fi
fi
