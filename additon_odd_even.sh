#two numbers as input from users
#add the two numbers and whether the result of addition is even or odd number 

#!/bin/bash

echo "Enter the first number"
read first
echo "Enter the second number"
read second

if [ -z "$first" ] || [ -z "$second" ]
then
        if [ -n "$first" ] && [ -z "$second" ]
        then
                echo "*********************************"
                echo "Second number field is empty"
        elif [ -z "$first" ] && [ -n "$second" ]
        then
                echo "*********************************"
                echo "First number field is empty"
        elif [ -z "$first" ] && [ -z "$second" ]
        then
                echo "*********************************"
                echo "First number field is empty"
                echo "Second number field is empty"
        else
                echo "*********************************"
                echo "Issues with the user input"
        fi
elif [ -n "$first" ] && [ -n "$second" ]
then
        echo "*************************************"
        echo "First number is --> $first"
        echo "Second number is --> $second"
        ans=$((first+second))
        if (($ans%2==0))
        then
                echo "*************************************"
                echo "$first + $second is --> $ans"
                echo "$ans is a even number"
        elif (($ans%2!=0))
        then
                echo "*************************************"
                echo "$first + $second is --> $ans"
                echo "$ans is a odd number"
        else
                echo "*************************************"
                echo "Something went wrong with calculation"
        fi
fi

------------------------------------------------------------------------------------------------------------------------------------------------
#advanced 

#!/bin/bash

echo "Enter the first number"
read first
echo "Enter the second number"
read second
if [ -z "$first" ] || [ -z "$second" ]
then
        if [ -n "$first" ] && [ -z "$second" ]
        then
                echo "***************************************"
                echo "Second number field is empty"
        elif [ -z "$first" ] && [ -n "$second" ]
        then
                echo "***************************************"
                echo "First number field is empty"
        elif [ -z "$first" ] && [ -z "$second" ]
        then
                echo "***************************************"
                echo "First number field is empty"
                echo "Second number field is empty"
        else
                echo "***************************************"
                echo "Issues with the user input"
        fi
elif [ -n "$first" ] && [ -n "$second" ]
then
        if [[ "$first" =~ [a-zA-Z] ]] || [[ "$second" =~ [a-zA-Z] ]]
        then
                if [[ "$first" =~ [a-zA-Z] ]] || [[ ! "$second" =~ [a-zA-Z] ]]
                then
                        echo "***************************************"
                        echo "First field cannot contain alphabets"
                elif [[ ! "$first" =~ [a-zA-Z] ]] || [[ "$second" =~ [a-zA-Z] ]]
                then
                        echo "***************************************"
                        echo "Second field cannot contain alphabets"
                elif [[ "$first" =~ [a-zA-Z] ]] || [[ "$second" =~ [a-zA-Z] ]]
                then
                        echo "***************************************"
                        echo "First field cannot contain alphabets"
                        echo "Second field cannot contain alphabets"
                fi
        elif [[ "$first" =~ ^[0-9]+$ ]] && [[ "$second" =~ ^[0-9]+$ ]]
        then
                ans=$((first+second))
                if (($ans%2==0))
                then
                        echo "****************************************"
                        echo "$first plus $second --> $ans"
                        echo "$ans is even number"
                elif (($ans%2!=0))
                then
                        echo "****************************************"
                        echo "$first plus $second --> $ans"
                        echo "$ans is odd number"
                else
                        echo "****************************************"
                        echo "Something went wrong with caculation"
                fi
        fi
fi

------------------------------------------------------------------------------------------------------------------------------------------------
#advanced with functions

#!/bin/bash

echo "Enter the first number"
read first
echo "Enter the second number"
read second

function first_number {
        [[ "$first" =~ ^[0-9]+$ ]]
}
function second_number {
        [[ "$second" =~ ^[0-9]+$ ]]
}

function first_number_false {
        [[ ! "$first" =~ ^[0-9]+$ ]]
}
function second_number_false {
        [[ ! "$second" =~ ^[0-9]+$ ]]
}

if [ -z "$first" ] || [ -z "$second" ]
then
        if [ -n "$first" ] && [ -z "$second" ]
        then
                echo "**********************************"
                echo "Second number field is empty"
        elif [ -z "$first" ] && [ -n "$second" ]
        then
                echo "**********************************"
                echo "First number field is empty"
        elif [ -z "$first" ] && [ -z "$second" ]
        then
                echo "**********************************"
                echo "First number field is empty"
                echo "Second number field is empty"
        else
                echo "**********************************"
                echo "Issues with the user input"
        fi
elif [ -n "$first" ] && [ -n "$second" ]
then
        if first_number && second_number
        then
                ans=$((first+second))
                if (($ans%2==0))
                then
                        echo "*************************************"
                        echo "$first plus $second --> $ans"
                        echo "$ans --> even number"
                elif (($ans%2!=0))
                then
                        echo "*************************************"
                        echo "$first plus $second --> $ans"
                        echo "$ans --> odd number"
                else
                        echo "*************************************"
                        echo "Issues with the user input"
                fi
        elif first_number_false || second_number_false
        then
                if first_number && second_number_false
                then
                        echo "************************************"
                        echo "Second number field must contain only digits"
                elif first_number_false && second_number
                then
                        echo "************************************"
                        echo "First number field must contain only digits"
                elif first_number_false && second_number_false
                then
                        echo "************************************"
                        echo "First number field must contain only digits"
                        echo "Second number field must contain only digits"
                else
                        echo "************************************"
                        echo "Issues with checking the user input"

                fi
        fi
fi


