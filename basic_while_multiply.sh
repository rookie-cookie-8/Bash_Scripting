#basic multiply while loop
#check if the multiplication of first and second number 
#if the result is greater than 1000 then quit, else continue  

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



