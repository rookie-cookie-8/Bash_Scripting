#script: Two numbers as user input -->Display the addition of numbers and check whether the result is odd or even number. 

#!/bin/bash

echo "Enter the first number"
read first

echo "Enter the second number"
read second

if [ -z "$first" ] || [ -z "$second" ]
then
        if [ -n "$first" ] && [ -z "$second" ]
        then
                echo "Second number field empty"
        elif [ -z "$first" ] && [ -n "$second" ]
        then
                echo "First number field empty"
        else
                echo "Something wrong with user input"
        fi
elif [ -n "$first" ] && [ -n "$second" ]
then
        ans=$((first+second))
        if (($ans%2==0))
        then
                echo "$first plus $second is: $ans"
                echo "Answer is even number"
        else
                echo "$first plus $second is: $ans"
                echo "Answer is Odd number"
        fi


fi
-----------------------------------------------------------------------------------------------------------------------------------------
#while loop 

#!/bin/bash

function user_input {
        echo "Enter the first number"
        read first
        echo "Enter the second number"
        read second
}

function validation_1 {
        if [ -z "$first" ] || [ -z "$second" ]
        then
                if [ -n "$first" ] && [ -z "$second" ]
                then
                        echo "Second number field is empty"
                        do_it_again
                elif [ -z "$first" ] && [ -n "$second" ]
                then
                        echo "First number field is empty"
                        do_it_again
                else
                        echo "Issues with the user input"
                        do_it_again
                fi
        fi
}
function validation_2 {
        if [ -n "$first" ] && [ -n "$second" ]
        then
                echo "***********************************"
                ans=$((first+second))
                if (($ans%2==0))
                then
                        echo "$first plus $second --> $ans"
                        echo "$ans --> Even number"
                        do_it_again
                else
                        echo "$first plus $second --> $odd"
                        echo "$ans --> Odd number"
                        do_it_again
                fi
        fi
}
function do_it_again {
        echo "********************************************"
        echo "Would you like to do it again"
        read option 
        if [ "$option" == "y" ] || [ "$option" == "Y" ]
        then
                user_input
                validation_1
                validation_2
        elif [ "$option" == "n" ] || [ "$option" == "N" ]
        then
                echo "Bye"
        else
                echo "Invalid user input"
        fi


}
user_input
validation_1
validation_2
