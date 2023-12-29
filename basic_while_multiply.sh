#basic multiply while loop
#check if the multiplication of first and second number 
#if the result is greater than 1000 then quit, else continue  
#!/bin/bash

echo "Enter the first number"
read first
echo "Enter the second number"
read second
echo "Enter the number to stop"
read stop

if [ -z "$first" ] || [ -z "$second" ] ||  [ -z "$stop" ]
then
        if [ -z "$first" ] && ( [ -n "$second" ] && [ -n "$stop" ] )
        then
                echo "First number field is empty"
        elif [ -z "$second" ] && ( [ -n "$first" ] && [ -n "$stop" ] )
        then
                echo "Second number field is empty"
        elif [ -z "$stop" ] && ( [ -n "$first" ] && [ -n "$second" ] )
        then
                echo "Stop number field is empty"
        elif [ -n "$first" ] && ( [ -z "$second" ] && [ -z "$stop" ] )
        then
                echo "Second and stop field is empty"
        elif [ -n "$second" ] && ( [ -z "$first" ] && [ -z "$stop" ] )
        then
                echo "First and stop field is empty"
        elif [ -n "$stop" ] && ( [ -z "$first" ] && [ -z "$second" ] )
        then
                echo "First and second field is empty"
        else
                echo "Something wrong with user input"
        fi

elif [ -n "$first" ] && [ -n "$second" ] && [ -n "$stop" ]
then
        ans=$((first*second))
        if [ $ans -gt $stop ]
        then
                echo "Cannot procede further as there is nothing to do"
        else
                while [ $ans -lt $stop ]
                do
                        ans=$((first*second))
                        echo "*************************************"
                        echo "$first * $second: $ans"
                        ((second++))
                        ans=$((first*second))

                done
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



