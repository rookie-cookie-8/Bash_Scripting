#username and uid_number input from the user
#script tells whether the username and the uid_number is available for the next use. 

#!/bin/bash
echo "Enter the username"
read username
echo "Enter the uid number"
read uid_number

if [ -z "$username" ] || [ -z "$uid_number" ]
then
        if [ -n "$username" ] && [ -z "$uid_number" ]
        then
                echo "UID number field is empty"
        elif [ -z "$username" ] && [ -n "$uid_number" ]
        then
                echo "Username field is empty"
        else
                echo "Issues with the user input"
        fi
elif [ -n "$username" ] && [ -n "$uid_number" ]
then
        cat /etc/passwd | grep -i "$username" | cut -d ":" -f1 > ./username_lists
        cat /etc/passwd | grep -i "$uid_number" | cut -d ":" -f3 > ./uid_lists
        if [ ! -s ./username_lists ] && [ ! -s ./uid_lists ]
        then
                echo "********************************************"
                echo "Username is available --> $username"
                echo "UID is available --> $uid_number"
                echo "********************************************"
        elif [ -s ./username_lists ] && [ ! -s ./uid_lists ]
        then
                echo "********************************************"
                echo "Username is not available --> $username"
                echo "UID is available --> $uid_number"
                echo "********************************************"
        elif [ ! -s ./username_lists ] && [ -s ./uid_lists ]
        then
                echo "********************************************"
                echo "Username is available --> $username"
                echo "UID is not available --> $uid_number"
                echo "********************************************"
        elif [ -s ./username_lists ] && [ -s ./uid_lists ]
        then
                echo "********************************************"
                echo "Username is not available --> $username"
                echo "UID is not available --> $uid_number"
                echo "********************************************"
        else
                echo "********************************************"
                echo "Snomething went wrong"
                echo "********************************************"
        fi
fi
rm -rf ./1
rm -rf ./username_lists
rm -rf ./uid_lists
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
#advanced

#!/bin/bash

echo "Enter the username"
read username
echo "Enter the uid number"
read uid_number

if [ -z "$username" ] || [ -z "$uid_number" ]
then
        if [ -n "$username" ] && [ -z "$uid_number" ]
        then
                echo "***************************************"
                echo "UID field is empty"
        elif [ -z "$username" ] && [ -n "$uid_number" ]
        then
                echo "***************************************"
                echo "Username field is empty"
        elif [ -z "$username" ] && [ -z "$uid_number" ]
        then
                echo "***************************************"
                echo "Username field is empty"
                echo "UID field is empty"
        else
                echo "***************************************"
                echo "Issues with the user input"
        fi
elif [ -n "$username" ] && [ -n "$uid_number" ]
then
        if [[ "$username" =~ [a-zA-Z] ]] && [[ "$uid_number" =~ ^[0-9]+$ ]]
        then
                cat /etc/passwd | cut -d ":" -f1 | grep -i "$username" > ./username_lists
                cat /etc/passwd | cut -d ":" -f3 | grep -i "$uid_number" > ./uid_number_lists
                if [ ! -s ./username_lists ] && [ ! -s ./uid_number_lists ]
                then
                        echo "**********************************"
                        echo "Username is available --> $username"
                        echo "UID is available --> $uid_number"
                elif [ -s ./username_lists ] && [ ! -s ./uid_number_lists ]
                then
                        echo "**********************************"
                        echo "Username is not available --> $username"
                        echo "UID is available --> $uid_number"
                elif [ ! -s ./username_lists ] && [ -s ./uid_number_lists ]
                then
                        echo "**********************************"
                        echo "Username is available --> $username"
                        echo "UID is not available --> $uid_number"
                elif [ -s ./username_lists ] && [ -s ./uid_number_lists ]
                then
                        echo "**********************************"
                        echo "Username is not available --> $username"
                        echo "UID is not available --> $uid_number"
                else
                        echo "**********************************"
                        echo "Something went wrong"
                fi
        elif [[ ! "$username" =~ [a-zA-Z] ]] || [[ ! "$uid_number" =~ ^[0-9]+$ ]]
        then
                if [[ "$username" =~ [a-zA-Z] ]] && [[ ! "$uid_number" =~ ^[0-9]+$ ]]
                then
                        echo "************************************"
                        echo "UID field can contain only numeric digits"
                elif [[ ! "$username" =~ [a-zA-Z] ]] && [[ "$uid_number" =~ ^[0-9]+$ ]]
                then
                        echo "************************************"
                        echo "Username field can only contain alpahbets"
                else
                        echo "************************************"
                        echo "Issues with the user input"
                fi
        fi
fi
rm -rf ./1
rm -rf ./username_lists
rm -rf ./uid_number_lists

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
#!/bin/bash

echo "Enter the username"
read username
echo "Enter the uid_number"
read uid_number

function user_name {
        [[ "$username" =~ [a-zA-Z] ]]
}
function uid_number_check {
        [[ "$uid_number" =~ ^[0-9]+$ ]]
}
function user_name_false {
        [[ ! "$username" =~ [a-zA-Z] ]]
}
function uid_number_false {
        [[ ! "$uid_number" =~ ^[0-9]+$ ]]
}

if [ -z "$username" ] || [ -z "$uid_number" ]
then
        if [ -n "$username" ] && [ -z "$uid_number" ]
        then
                echo "***************************************"
                echo "UID field is empty"
        elif [ -z "$username" ] && [ -n "$uid_number" ]
        then
                echo "***************************************"
                echo "Username field is empty"
        elif [ -z "$username" ] && [ -z "$uid_number" ]
        then
                echo "***************************************"
                echo "Username field is empty"
                echo "UID field is empty"
        else
                echo "***************************************"
                echo "Issues with the user input"
        fi
elif [ -n "$username" ] && [ -n "$uid_number" ]
then
        if user_name && uid_number_check
        then
                cat /etc/passwd | grep -i "$username" | cut -d ":" -f1 > ./username_lists
                cat /etc/passwd | grep -i "$uid_number" | cut -d ":" -f3 > ./uid_number_lists
                if [ ! -s ./username_lists ] && [ ! -s ./uid_number_lists ]
                then
                        echo "***************************************"
                        echo "Username is available --> $username"
                        echo "UID number is available --> $uid_number"
                elif [ -s ./username_lists ] && [ ! -s ./uid_number_lists ]
                then
                        echo "***************************************"
                        echo "Username is not available --> $username"
                        echo "UID number is available --> $uid_number"
                elif [ ! -s ./username_lists ] && [ -s ./uid_number_lists ]
                then
                        echo "***************************************"
                        echo "Username is available --> $username"
                        echo "UID number is not available --> $uid_number"
                elif [ -s ./username_lists ] && [ -s ./uid_number_lists ]
                then
                        echo "***************************************"
                        echo "Username is not available --> $username"
                        echo "UID number is not available --> $uid_number"
                else
                        echo "***************************************"
                        echo "Something went wrong in checking"
                fi
        elif user_name_false || uid_number_false
        then
                if user_name && uid_number_false
                then
                        echo "********************************************"
                        echo "UID number field must contain only numeric digits"
                elif user_name_false && uid_number_check
                then
                        echo "********************************************"
                        echo "Username field must contain alphabets"
                elif user_name_false && uid_number_false
                then
                        echo "********************************************"
                        echo "Username field must contain alphabets"
                        echo "UID number field must contain only numeric digits"
                else
                        echo "********************************************"
                        echo "Soemthing went wrong"
                fi
        fi
fi
rm -rf ./1
rm -rf ./username_lists
rm -rf ./uid_number_lists
