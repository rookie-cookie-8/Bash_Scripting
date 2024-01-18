#basic multiply while loop
#check if the multiplication of first and second number 
#if the result is greater than 1000 then quit, else continue  
#!/bin/bash

echo "Enter the first number"
read first
echo "ENter the multiplier"
read multiplier
echo "Enter the number to stop the multiplication"
read stop

if [ -z "$first" ] || [ -z "$multiplier" ] || [ -z "$stop" ]
then
        if [ -n "$first" ] && ( [ -z "$multiplier" ] && [ -z "$stop" ] )
        then
                echo "*************************************"
                echo "Multiplier field is empty"
                echo "Stop field is empty"
        elif [ -z "$stop" ] && ( [ -n "$multiplier" ] && [ -n "$first" ] )
        then
                echo "*************************************"
                echo "Stop field is empty"
        elif [ -z "$multiplier" ] && ( [ -n "$stop" ] && [ -n "$first" ] )
        then
                echo "*************************************"
                echo "multiplier field is empty"
        elif [ -n "$stop" ] && ( [ -z "$multiplier" ] && [ -n "$first" ] )
        then
                echo "*************************************"
                echo "multiplier field is empty"
                echo "first field is empty"
        elif [ -n "$multiplier" ] && ( [ -z "$first" ] && [ -z "$stop" ] )
        then
                echo "*************************************"
                echo "first field is empty"
                echo "stop field is empty"
        elif [ -n "$stop" ] && ( [ -z "$multiplier" ] && [ -z "$first" ] )
        then
                echo "*************************************"
                echo "Multiplier field is empty"
                echo "first field is empty"
        elif [ -z "$first" ] && ( [ -n "$multiplier" ] && [ -n "$stop" ] )
        then
                echo "*************************************"
                echo "First field is empty"
        elif [ -z "$first" ] && [ -z "$multiplier" ] && [ -z "$stop" ]
        then
                echo "*************************"
                echo "First field is empty"
                echo "Multiplier field is empty"
                echo "Stop field is empty"
        fi
elif [ -n "$first" ] && [ -n "$multiplier" ] && [ -n "$stop" ]
then
        echo "************************************************"
        ans=$((first*multiplier))
        if [ $ans -lt $stop ]
        then
                while [ $ans -lt $stop ]
                do
                        ans=$((first*multiplier))
                        echo "$first * $multiplier is $ans"
                        ((multiplier++))
                        ans=$((first*multiplier))
                done
        else
                echo "$first * $multiplier is: $ans" 
                echo "$ans greater than $stop"
                echo "Bye"
        fi

fi


---------------------------------------------------------------------------------------------------------------------------------------------------------
#!/bin/bash

echo "Enter the first number"
read first

echo "Enter the second number"
read second

if [ -z "$first" ] || [ -z "$second" ]
then
        if [ -n "$first" ] && [ -z "$second" ]
        then
                echo "Second number field is empty"
        elif [ -z "$first" ] && [ -n "$second" ]
        then
                echo "First number field is empty"
        else
                echo "Both number field empty"
        fi
elif [ -n "$first" ] && [ -n "$second" ]
then
        ans=$((first*second))
        echo "$first times $second is: $ans"
        while [ $ans -le 1000 ]
        do
                echo "*********************************"
                ans=$((first*second))
                echo "$first times $second is: $ans"
                ((second++))
                ans=$((first*second))
        done
echo "Answer is greater than 1000, QUIT"
fi
---------------------------------------------------------------------------------------------------------------------------------------------------------
#!/bin/bash

echo "Enter the first number"
read first
echo "ENter the second number"
read second
echo "Enter the number, to stop the multiplication"
read end

if [ -z "$first" ] || [ -z "$second" ] || [ -z "$end" ]
then
        if [ -n "$first" ] && [ -n "$second" ] && [ -z "$end" ]
        then
                echo "Stop number field is empty"
        elif [ -z "$first" ] && [ -n "$second" ] && [ -n "$end" ]
        then
                echo "First number field is empty"
        elif [ -n "$first" ] && [ -z "$second" ] && [ -n "$end" ]
        then
                echo "Second number field is empty"
        else
                echo "User input missing"
        fi

elif [ -n "$first" ] && [ -n "$second" ] && [ -n "$end" ]
then
        ans=$((first*second))
        echo "****************************************"
        if [ $ans -le $end ]
        then
                while [ $ans -lt $end ]
                do
                        echo "$first * $second --> $ans"
                        ((second++))
                        ans=$((first*second))

                done
        else
                echo "Answer is greater than the end number"
                echo "Bye"
        fi
fi

---------------------------------------------------------------------------------------------------------------------------------------------------------
#while loop 

#!/bin/bash

function user-input {
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
                        again
                elif [ -z "$first" ] && [ -n "$second" ]
                then
                        echo "First number field is empty"
                        again
                else
                        echo "User input is missing"
                        again
                fi
        fi
}
function validation_2 {
        if [ -n "$first" ] && [ -n "$second" ]
        then
                echo "*********************************"
                echo "First number is: $first"
                echo "Second number is: $second"
                echo "*********************************"
                ans=$((first+second))
                if (($ans%2==0))
                then
                        echo "Result of addition --> $ans"
                        echo "$ans --> Even number"
                        echo "*********************************"
                        again
                else
                        echo "Result of addition --> $ans"
                        echo "$ans --> odd number"
                        echo "*********************************"
                        again
                fi
        fi
}
function again {
        echo "Would you like to perform the action once again"
        read option
        if [ "$option" == "Y" ] || [ "$option" == "y" ]
        then
                user-input
                validation_1
                validation_2
        else
                echo "bye"
        fi
}



user-input
validation_1
validation_2



