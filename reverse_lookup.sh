#oscp reverse look up
#!/bin/bash

echo "Enter the HOst part i.e. 1.1.1"
read host_part
echo "Enter the first host_part"
read first
echo "ENter the last host_part"
read last

if [ -z "$host_part" ] || [ -z "$first" ] || [ -z "$last" ]
then
        if [ -z "$host_part" ] && ( [ -n "$first" ] && [ -n "$last" ] )
        then
                echo "Host field empty"
        elif [ -z "$first" ] && ( [ -n "$host_part" ] && [ -n "$last" ] )
        then
                echo "First field empty"
        elif [ -z "$last" ] && ( [ -n "$host_part" ] && [ -n "$first" ] )
        then
                echo "last field empty"
        else
                echo "SOmething wrong with user input"
        fi

elif [ -n "$host_part" ] && [ -n "$first" ] && [ -n "$last" ]
then
        for ip in $(seq $first $last)
        do
                host $host_part.$ip

        done
fi
