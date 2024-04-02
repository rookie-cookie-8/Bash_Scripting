#Diplsay all the odd numbers within the user specified range
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
        echo "First number is: $first"
        echo "Second number is: $second"
        echo "**********************************"
        echo "Diplay Odd numbers between $first and $second"
        echo "**********************************"
        for even in $(seq $first $second)
        do
                if(($even%2!=0))
                then
                        echo "Odd number: $even"
                else
                        continue
                fi

        done
fi
----------------------------------------------------------------------------------------------------------------
#!/bin/bash

echo "Enter the first number"
read first
echo "Enter the second number"
read second

if [ -z "$first" ] || [ -z "$second" ]
then
        if [ -z "$first" ] && [ -n "$second" ]
        then
                echo "First number field is empty"
        elif [ -n "$first" ] && [ -z "$second" ]
        then
                echo "Second number field is empty"
        else
                echo "Issues with the user input"
        fi

elif [ -n "$first" ] && [ -n "$second" ]
then
        echo "*********************************"
        for even_numbers in $(seq $first $second)
        do
                if (( $even_numbers%2!=0))
                then
                        echo "$even_numbers"
                        sleep 0.2
                else
                        continue
                fi

        done

fi
----------------------------------------------------------------------------------------------------------------
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
                echo "Issues with the user input"
        fi


elif [ -n "$first" ] && [ -n "$second" ]
then
        if [ $first -lt $second ]
        then
                        echo "*****Printing odd numbers in range between $first and $second***************"
                for even_numbers in $(seq $first $second)
                do
                        if (($even_numbers%2!=0))
                        then
                                echo "NUmber --> $even_numbers"
                        else
                                continue
                        fi

                done
        else
                echo "First number cannot be grater than second" 
        fi

fi


