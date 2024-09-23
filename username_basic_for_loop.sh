#Display the username from the specified file as per the user input and used the for loop. For basic understanding

#!/bin/bash

echo "Enter the file location"
read file_location

if [ -z "$file_location" ]
then
        echo "User input missing"
else
        if [ -e $file_location ]
        then
                if [ -f $file_location ]
                then
                        echo "**********************************************"
                        echo "Lets check the username with for loop"
                        cat $file_location | cut -d ":" -f1 | sort > ./username_list
                        sleep 3
                        for names in $(cat ./username_list )
                        do
                                echo "Hello $names"
                                sleep 0.1

                        done
                else
                        echo "File found, but not a regular file"
                fi
        else
                echo "File not found"
        fi

fi
rm -rf ./1
rm -rf ./username_list
-------------------------------------------------------------------------------------------------------------------------------------------------------
#!/bin/bash

echo "Enter the username"
read username

if [ -z "$username" ]
then
        echo "Username field cannot be empty"
else
        echo "****************************************"
        for names in $(cat /etc/passwd | cut -d ":" -f1)
        do
                if [ "$names" == "$username" ]
                then
                        echo "Username found --> $names"
                        sleep 0.5
                else
                        echo $names
                        sleep 0.5
                fi

        done
fi
