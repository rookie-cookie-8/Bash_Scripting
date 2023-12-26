#for oscp, exercise to conduct ping sweep in order to find active host with the same network

#!/bin/bash

echo "Enter the network part i.e. 192.168.1"
read network

echo "Enter the first network"
read first
echo "ENter the last network"
read last

if [ -z "$network" ] || [ -z "$first" ] || [ -z "$last" ]
then
        if [ -z "$network" ] && [ -n "$first" ] && [ -n "$last" ]
        then
                echo "Network part is empty"
        elif [ -n "$network" ] && [ -z "$first" ] && [ -n "$last" ]
        then
                echo "First network is empty"
        elif [ -n "$network" ] && [ -n "$first" ] && [ -z "$last" ]
        then
                echo "Last network is empty"
        else
                echo "User input field missing"
        fi
elif [ -n "$network" ] && [ -n "$first" ] && [ -n "$last" ]
then
        echo "************************************"
        echo "Sending ICMP packets to $network.$first-$last"
        echo "************************************"
        for host in $(seq $first $last)
        do
                ping -c 1 $network.$host | grep -i "64 bytes" | cut -d " " -f4 | tr -d ":" >> ./host-alive &
                sleep 0.2
        done
sleep 2
cat ./host-alive | uniq
rm -rf ./1
rm -rf ./host-alive

fi

----------------------------------------------------------------------------------------------------------------------------------------------------------
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
