
echo "Enter the first number"
read first

echo "Enter the second number"
read second

if [ -z "$first" ] || [ -z "$second" ]
then
        if [ -n "$first" ] && [ -z "$second " ]
        then
                echo "Second number field empty"
        elif [ -z "$first" ] && [ -n "$second " ]
        then
                echo "First number field empty"
        else
                echo "Both field empty"
        fi

elif [ -n "$first" ] && [ -n "$second" ]
then
        ans=$((first*second))
        echo "$first times $second: $ans"
        echo "*********************************"
        while [ $ans -lt 1000 ]
        do
                echo "Would you like to multiply $ans by new number. Y or N"
                read choice
                if [ "$choice" == "Y" ]
                        then
                                echo "Enter new number"
                                read new_number
                                new_answer=$((ans*new_number))
                                echo "$ans times $new_number: $new_answer"
                                ans=$new_answer
                else
                        echo "Bye"
                        break
                fi

        done
fi
---------------------------------------------------------------------------------------------------------------------------------------
#!/bin/bash

echo "Enter the first number"
read first

echo "Enter the second number"
read second

echo "Enter the result"
read result

if [ -z "$first" ] || [ -z "$second" ] || [ -z "$result" ]
then
        if [ -n "$first" ] && [ -n "$second" ] && [ -z "$result" ]
        then
                echo "Result field missing"
        elif [ -z "$first" ] && [ -n "$second" ] && [ -n "$result" ]
        then
                echo "First field missing"
        elif [ -n "$first" ] && [ -z "$second" ] && [ -n "$result" ]
        then
                echo "Second field missing"
        else
                echo "Something missing with the user input"
        fi

elif [ -n "$first" ] && [ -n "$second" ] && [ -n "$result" ]
then
        answer=$((first*second))
        if [ $answer -lt $result ]
        then
                while [ $answer -lt $result ]
                do
                        answer=$((first*second))
                        echo "*************************************************"
                        echo "$first times $second: $answer"
                        ((second++))
                        answer=$((first*second))

                done
        else
                echo "$first times $second is more than 500, bye"
        fi

fi

