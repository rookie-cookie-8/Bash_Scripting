#User input numbers in range
#Display the numbers i.e. even or odd within the user specified range

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
                echo "User input missing"
        fi

elif [ -n "$first" ] && [ -n "$second" ]
then
        echo "*****************************************"
        echo "Would you like to view even or odd numbers"
        read choice
        if [ "$choice" == "even" ]
        then
                for numbers in $(seq $first $second)
                do
                        if (($numbers%2==0))
                        then
                                echo "$numbers"
                        else
                                continue
                        fi
                done
        else
                for numbers in $(seq $first $second)
                do
                        if (($numbers%2!=0))
                        then
                                echo $numbers
                        else
                                continue
                        fi
                done
        fi
fi
--------------------------------------------------------------------------------------------------------------------------------------------------
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
                echo "User input missing"
        fi

elif [ -n "$first" ] && [ -n "$second" ]
then
        if [ $first -lt $second ]
        then
                echo "*****************************************"
                echo "Would you like to view even or odd numbers"
                read choice
                if [ "$choice" == "even" ]
                then
                        for numbers in $(seq $first $second)
                        do
                                if (($numbers%2==0))
                                then
                                        echo "$numbers"
                                else
                                        continue
                                fi
                        done
                else
                        for numbers in $(seq $first $second)
                        do
                                if (($numbers%2!=0))
                                then
                                        echo $numbers
                                else
                                        continue
                                fi
                        done
                fi
        else
                echo "Second number cannot be lesser, try again later"
        fi
fi
