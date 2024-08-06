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
echo "Enter the stop_number"
read stop_number

if [ -z "$first" ] || [ -z "$multiplier" ] || [ -z "$stop_number" ]
then
        if [ -n "$first" ] && [ -z "$multiplier" ] && [ -z "$stop_number" ]
        then
                echo "***************************************"
                echo "Multiplier field is empty"
                echo "Stop number field is empty"
        elif [ -n "$first" ] && [ -n "$multiplier" ] && [ -z "$stop_number" ]
        then
                echo "***************************************"
                echo "Stop number field is empty"
        elif [ -n "$first" ] && [ -z "$multiplier" ] && [ -n "$stop_number" ]
        then
                echo "***************************************"
                echo "Multiplier field is empty"
        elif [ -z "$first" ] && [ -n "$multiplier" ] && [ -n "$stop_number" ]
        then
                echo "***************************************"
                echo "First number field is empty"
        elif [ -z "$first" ] && [ -z "$multiplier" ] && [ -n "$stop_number" ]
        then
                echo "***************************************"
                echo "First number field is empty"
                echo "Multiplier field is empty"
        elif [ -z "$first" ] && [ -n "$multiplier" ] && [ -z "$stop_number" ]
        then
                echo "***************************************"
                echo "First number field is empty"
                echo "Stop number field is empty"
        elif [ -z "$first" ] && [ -z "$multiplier" ] && [ -z "$stop_number" ]
        then
                echo "***************************************"
                echo "First number field is empty"
                echo "Multiplier field is empty"
                echo "Stop number field is empty"
        else
                echo "***************************************"
                echo "Issues with the user input"
        fi
elif [ -n "$first" ] && [ -n "$multiplier" ] && [ -n "$stop_number" ]
then
        if [[ "$first" =~ ^[0-9]+$ ]] && [[ "$multiplier" =~ ^[0-9]+$ ]] && [[ "$stop_number" =~ ^[0-9]+$ ]]
        then
                ans=$((first*multiplier))
                if [ $ans -lt $stop_number ]
                then
                        while [ $ans -lt $stop_number ]
                        do
                                ans=$((first*multiplier))
                                echo "$first times $multiplier --> $ans"
                                ((multiplier++))
                                ans=$((first*multiplier))
                                sleep 0.3
                        done
                elif [ $ans -ge $stop_number ]
                then
                        if [ $ans -eq $stop_number ]
                        then
                                echo "**********************************"
                                echo "$first times $multiplier --> $ans"
                                echo $ans equal to $stop_number
                                echo "Cannot do anything"
                        elif [ $ans -gt $stop_number ]
                        then
                                echo "**********************************"
                                echo "$first times $multiplier --> $ans"
                                echo "$ans is greater than $stop_number"
                                echo "Cannot do anything"
                        else
                                echo "**********************************"
                                echo "Something went wrong with caculation"
                        fi

                fi
        elif [[ ! "$first" =~ ^[0-9]+$ ]] || [[ ! "$multiplier" =~ ^[0-9]+$ ]] || [[ ! "$stop_number" =~ ^[0-9]+$ ]]
        then
                echo "************************************"
                echo "User input must contain only numeric digits"
                echo "Kindly check the user input"
        fi
fi


