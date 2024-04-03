#!/bin/bash

echo "Enter the name"
read name


if [ ${#name} -gt 10 ]
then
        echo "Your name is ${name^^}"        #uppercase
        echo "Your name is ${name,,}"        #lowercase
else
        echo "Bye"
fi
-------------------------------------------------------------------------------------------------------------------------
#!/bin/bash

echo "Enter the name"
read name

if [ "$name" == "${name^^}" ]
then
        echo "Name is in upper case"
else
        echo "Name is on lower case"
fi
-------------------------------------------------------------------------------------------------------------------------
#!/bin/bash

echo "Enter your full name"
read full_name

if [ -z "$full_name" ]
then
        echo "User input empty"
else
        if [ ${#full_name} -lt 5 ]
        then
                echo "Full name must be greater than 5"
        else
                if [ "$full_name" == "${full_name^^}" ]
                then
                        echo "Name is -----> $full_name"
                else
                        echo "Name is --> ${full_name^^}"
                fi
        fi
fi
