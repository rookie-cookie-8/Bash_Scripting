#ping sweep for oscp
#!/bin/bash

echo "Enter the Host portion i.e. 1.1.1."
read host
echo "Enter the first ip"
read first
echo "Enter the last ip"
read last

if [ -z "$host" ] || [ -z "$first" ] || [ -z "$last" ]
then
        if [ -z "$host" ] && ( [ -n "$first" ] && [ -n "$last" ] )
        then
                echo "host: User input empty"
        elif [ -z "$first" ] && ( [ -n "$host" ] && [ -n "$last" ] )
        then
                echo "first: User input empty"
        elif [ -z "$last" ] && ( [ -n "$host" ] && [ -n "$host" ] )
        then
                echo "last: User input empty"
        else
                echo "Multiple user input field is missing"
        fi

elif [ -n "$host" ] && [ -n "$first" ] && [ -n "$last" ]
then
        echo "Wait for few seconds, checking host"
        for ip in $(seq $first $last)
        do
                ping -c 1 $host$ip | grep -i "64 bytes" | cut -d " " -f4 | tr -d ":" >> ./host_alive &
                sleep 0.1
        done
fi
cat ./host_alive | sort -h | uniq

rm -rf ./1
rm -rf ./host_alive
