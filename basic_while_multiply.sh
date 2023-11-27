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

echo "Enter the second"
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
                echo "Soemthing wrong with user input"
        fi

elif [ -n "$first" ] && [ -n "$second" ]
then
        ans=$((first*second))
        while [ $ans -lt 100 ]
        do
                ans=$((first*second))
                echo "*************************************"
                echo "First number is: $first"
                echo "Second number is: $second"
                echo "$first times $second is: $ans"
                ((second++))
                ans=$((first*second))
        done
fi


