#Basic while loop: User inputs the first number, multiplier, and stop number. 
#The first number is then multiplied by the multiplier until reaching the stop number
#if the result of multiplication i.e. first times $multiplier is greater than stop_number .. nothing to do
#or else do the multiplication until the result is less than stop_number

#!/bin/bash

echo "Enter the first number"
read first
echo "Enter the multiplier number"
read multiplier
echo "Enter the stop number"
read stop_number


if [ -z "$first" ] || [ -z "$multiplier" ] || [ -z "$stop_number" ]
then
        if [ -n "$first" ] && [ -z "$multiplier" ] && [ -z "$stop_number" ]
        then
                echo "**************************************"
                echo "Multiplier number field empty"
                echo "Stop number field empty"
        elif [ -n "$first" ] && [ -n "$multiplier" ] && [ -z "$stop_number" ]
        then
                echo "**************************************"
                echo "Stop number field empty"
        elif [ -n "$first" ] && [ -z "$multiplier" ] && [ -n "$stop_number" ]
        then
                echo "**************************************"
                echo "Multiplier number field empty"
        elif [ -z "$first" ] && [ -n "$multiplier" ] && [ -n "$stop_number" ]
        then
                echo "**************************************"
                echo "First number field empty"
        elif [ -z "$first" ] && [ -z "$multiplier" ] && [ -n "$stop_number" ]
        then
                echo "**************************************"
                echo "First number field empty"
                echo "Multiplier number field empty"
        elif [ -z "$first" ] && [ -n "$multiplier" ] && [ -z "$stop_number" ]
        then
                echo "**************************************"
                echo "First number field empty"
                echo "Stop number field empty"
        elif [ -z "$first" ] && [ -z "$multiplier" ] && [ -z "$stop_number" ]
        then
                echo "**************************************"
                echo "First number field empty"
                echo "Multiplier number field empty"
                echo "Stop number field empty"
        else
                echo "**************************************"
                echo "Something went wrong"
        fi

elif [ -n "$first" ] && [ -n "$multiplier" ] && [ -n "$stop_number" ]
then
        ans=$((first*multiplier))
        if [ $ans -le $stop_number ]
        then
                while [ $ans -le $stop_number ]
                do
                        ans=$((first*multiplier))
                        echo "*******************************************"
                        echo "$first times $multiplier  --> $ans"
                        ((multiplier++))
                        sleep 0.5

                done
        elif [ $ans -gt $stop_number ]
        then
                echo "**************************************"
                echo "$first times $multiplier --> $ans"
                echo "$ans greater than or equal to $stop_number"
                echo "Nothing to do"
        else
                echo "Something went wrong"
        fi
fi

-------------------------------------------------------------------------------------------------------------------------------------------------------------
#advanced
#!/bin/bash

echo "Enter the first number"
read first
echo "Enter the multiplier number"
read multiplier
echo "Enter the stop number"
read stop_number

function first_check {
        [[ "$first" =~ ^[0-9]+$ ]]
}
function multiplier_check {
        [[ "$multiplier" =~ ^[0-9]+$ ]]
}
function stop_number_check {
        [[ "$stop_number" =~ ^[0-9]+$ ]]
}


function first_wrong {
        [[ ! "$first" =~ ^[0-9]+$ ]]
}
function multiplier_wrong {
        [[ ! "$multiplier" =~ ^[0-9]+$ ]]
}
function stop_number_wrong {
        [[ ! "$stop_number" =~ ^[0-9]+$ ]]
}


if [ -z "$first" ] || [ -z "$multiplier" ] || [ -z "$stop_number" ]
then
        if [ -n "$first" ] && [ -z "$multiplier" ] && [ -z "$stop_number" ]
        then
                echo "****************************************"
                echo "Multiplier field is empty"
                echo "Stop number field is empty"
        elif [ -n "$first" ] && [ -n "$multiplier" ] && [ -z "$stop_number" ]
        then
                echo "****************************************"
                echo "Stop number field is empty"
        elif [ -n "$first" ] && [ -z "$multiplier" ] && [ -n "$stop_number" ]
        then
                echo "****************************************"
                echo "Multiplier field is empty"
        elif [ -z "$first" ] && [ -z "$multiplier" ] && [ -n "$stop_number" ]
        then
                echo "****************************************"
                echo "First number field is empty"
                echo "Multiplier field is empty"
        elif [ -z "$first" ] && [ -n "$multiplier" ] && [ -n "$stop_number" ]
        then
                echo "****************************************"
                echo "First number field is empty"
        elif [ -z "$first" ] && [ -n "$multiplier" ] && [ -z "$stop_number" ]
        then
                echo "****************************************"
                echo "First number field is empty"
                echo "Stop number field is empty"
        elif [ -z "$first" ] && [ -z "$multiplier" ] && [ -z "$stop_number" ]
        then
                echo "****************************************"
                echo "First number field is empty"
                echo "Multiplier field is empty"
                echo "Stop number field is empty"
        else
                echo "****************************************"
                echo "Issues with the user input"
        fi
elif [ -n "$first" ] && [ -n "$multiplier" ] && [ -n "$stop_number" ]
then
        if first_wrong || multiplier_wrong || stop_number_wrong
        then
                if first_check && multiplier_wrong && stop_number_wrong
                then
                        echo "*******************************************"
                        echo "Multiplier field can only contain numeric digits"
                        echo "Stop number field can only contain numeric digits"
                elif first_check && multiplier_check && stop_number_wrong
                then
                        echo "*******************************************"
                        echo "Stop number field can only contain numeric digits"
                elif first_check && multiplier_wrong && stop_number_check
                then
                        echo "*******************************************"
                        echo "Multiplier field can only contain numeric digits"
                elif first_wrong && multiplier_wrong && stop_number_check
                then
                        echo "*******************************************"
                        echo "First field can only contain numeric digits"
                        echo "Multiplier field can only contain numeric digits"
                elif first_wrong && multiplier_check && stop_number_check
                then
                        echo "*******************************************"
                        echo "First field can only contain numeric digits"
                elif first_wrong && multiplier_check && stop_number_wrong
                then
                        echo "*******************************************"
                        echo "First field can only contain numeric digits"
                        echo "Stop number field can only contain numeric digits"
                elif first_wrong && multiplier_wrong && stop_number_wrong
                then
                        echo "*******************************************"
                        echo "First field can only contain numeric digits"
                        echo "Multiplier field can only contain numeric digits"
                        echo "Stop number field can only contain numeric digits"
                else
                        echo "******************************************"
                        echo "Something went wrong with user input validation"
                fi
        elif first_check && multiplier_check && stop_number_check
        then
                ans=$((first*multiplier))
                if [ $ans -lt $stop_number ]
                then
                        echo "**************************************"
                        while [ $ans -lt $stop_number ]
                        do
                                echo "$first times $multiplier --> $ans"
                                ((multiplier++))
                                ans=$((first*multiplier))
                                sleep 0.5
                        done
                elif [ $ans -eq $stop_number ]
                then
                        echo "***********************************"
                        echo "$first times $multiplier --> $ans"
                        echo "Result is equal to stop number"
                        echo "Nothing to do"
                elif [ $ans -gt $stop_number ]
                then
                        echo "***********************************"
                        echo "$first times $multiplier --> $ans"
                        echo "Result is greater to stop number"
                        echo "Nothing to do"
                else
                        echo "***********************************"
                        echo "Something went wrong with caculation"
                fi
        fi


fi

-------------------------------------------------------------------------------------------------------------------------------------------------------------------
#!/bin/bash

echo "Enter the first number"
read first
echo "Enter the multiplier number"
read multiplier
echo "Enter the stop number"
read stop_number

function first_right {
        [[ $first =~ ^[0-9]+$ ]]
}
function first_wrong {
        [[ ! $first =~ ^[0-9]+$ ]]
}
function multiplier_right {
        [[ $multiplier =~ ^[0-9]+$ ]]
}
function multiplier_wrong {
        [[ ! $multiplier =~ ^[0-9]+$ ]]
}
function stop_right {
        [[ $stop_number =~ ^[0-9]+$ ]]
}
function stop_wrong {
        [[ ! $stop_number =~ ^[0-9]+$ ]]
}

if [ -z "$first" ] || [ -z "$multiplier" ] || [ -z "$stop_number" ]
then
        if [ -n "$first" ] && [ -z "$multiplier" ] && [ -z "$stop_number" ]
        then
                echo "**********************************"
                echo "Multiplier number field is empty"
                echo "Stop number field is empty"
        elif [ -n "$first" ] && [ -n "$multiplier" ] && [ -z "$stop_number" ]
        then
                echo "**********************************"
                echo "Stop number field is empty"
        elif [ -n "$first" ] && [ -z "$multiplier" ] && [ -n "$stop_number" ]
        then
                echo "**********************************"
                echo "Multiplier number field is empty"
        elif [ -z "$first" ] && [ -z "$multiplier" ] && [ -n "$stop_number" ]
        then
                echo "**********************************"
                echo "First number field is empty"
                echo "Multiplier number field is empty"
        elif [ -z "$first" ] && [ -n "$multiplier" ] && [ -n "$stop_number" ]
        then
                echo "**********************************"
                echo "First number field is empty"
        elif [ -z "$first" ] && [ -n "$multiplier" ] && [ -z "$stop_number" ]
        then
                echo "**********************************"
                echo "First number field is empty"
                echo "Stop number field is empty"
        elif [ -z "$first" ] && [ -z "$multiplier" ] && [ -z "$stop_number" ]
        then
                echo "**********************************"
                echo "First number field is empty"
                echo "Multiplier number field is empty"
                echo "Stop number field is empty"
        else
                echo "**********************************"
                echo "Issues with the user input"
        fi

elif [ -n "$first" ] && [ -n "$multiplier" ] && [ -n "$stop_number" ]
then
        if first_wrong || multiplier_wrong || stop_wrong
        then
                if first_right && multiplier_wrong && stop_wrong
                then
                        echo "*************************************"
                        echo "Multiplier field must contain only digits"
                        echo "Stop number field must contain only digits"
                elif first_right && multiplier_right && stop_wrong
                then
                        echo "*************************************"
                        echo "Stop number field must contain only digits"
                elif first_right && multiplier_wrong && stop_right
                then
                        echo "*************************************"
                        echo "Multiplier number field must contain only digits"
                elif first_wrong && multiplier_wrong && stop_right
                then
                        echo "*************************************"
                        echo "First number field must contain only digits"
                        echo "Multiplier number field must contain only digits"
                elif first_wrong && multiplier_right && stop_right
                then
                        echo "*************************************"
                        echo "First number field must contain only digits"
                elif first_wrong && multiplier_right && stop_wrong
                then
                        echo "*************************************"
                        echo "First number field must contain only digits"
                        echo "Stop number field must contain only digits"
                elif first_wrong && multiplier_wrong && stop_wrong
                then
                        echo "*************************************"
                        echo "First number field must contain only digits"
                        echo "Multiplier number field must contain only digits"
                        echo "Stop number field must contain only digits"
                fi
        elif first_right && multiplier_right && stop_right
        then
                ans=$(($first*$multiplier))
                if [ $ans -lt $stop_number ]
                then
                        while [ $ans -lt $stop_number ]
                        do
                                echo "**********************************"
                                echo "$first times $multiplier --> $ans"
                                ((multiplier++))
                                ans=$(($first*$multiplier))
                                sleep 0.5
                        done
                elif [ $ans -eq $stop_number ]
                then
                        echo "***************************************"
                        echo "$first times $multiplier --> $ans"
                        echo "$ans is equal to $stop_number"
                        echo "Nothing can be done"
                elif [ $ans -gt $stop_number ]
                then
                        echo "***************************************"
                        echo "$first times $multiplier --> $ans"
                        echo "$ans is greather than $stop_number"
                        echo "Nothing can be done"
                else
                        echo "***************************************"
                        echo "Issues with calculation"
                fi

        fi
fi
