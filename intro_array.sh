#array allows the user to store multiple values / data into a single variable. 
#array values are called as per the index which starts from zero
#!/bin/bash

echo "Enter your full name i.e. First, Dad, Grandfather, Last Name"
read name1 name2 name3 name4

full_name=($name1 $name2 $name3 $name4)
#full_name=(0 1 2 3)

for names in ${full_name[@]}
do
        echo $names
done

numbers=(1 2 3 4 5)
echo "${a[1]}"
-----------------------------------------------------------------------------------------------------------------------------------------------
#!/bin/bash

array=("Hrishi" "Ghosalkar" 32)

echo ${array[@]}
echo "**********************************************"
for names in ${array[@]}
do
        if [ "$names" == "Hrishi" ]
        then
                echo "First name is $names"
                continue
        elif [ "$names" == "Ghosalkar" ]
        then
                echo "Middle name is $names"
                continue
        elif [ "$names" == "32" ]
        then
                echo "Age is $names"
                continue
        fi
done

-----------------------------------------------------------------------------------------------------------------------------------------------
