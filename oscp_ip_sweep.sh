#for oscp exercise, network ip sweep


#!/bin/bash

echo "Enter the network i.e. 192.168.100"
read network
echo "Enter the first host"
read first
echo "Enter the last host"
read last

if [ -z "$network" ] || [ -z "$first" ] || [ -z "$last" ]
then
        if [ -n "$network" ] && ( [ -z "$first" ] && [ -z "$last" ] )
        then
                echo "**************************************"
                echo "First host field is empty"
                echo "Last host field is empty"
        elif [ -z "$first" ] && ( [ -n "$network" ] && [ -n "$last" ] )
        then
                echo "**************************************"
                echo "First host field is empty"
        elif [ -z "$last" ] && ( [ -n "$network" ] && [ -n "$first" ] )
        then
                echo "**************************************"
                echo "Last host field is empty"
        elif [ -n "$first" ] && ( [ -z "$network" ] && [ -z "$last" ] )
        then
                echo "**************************************"
                echo "Network host field is empty"
                echo "Last host field is empty"
        elif [ -z "$first" ] && ( [ -n "$network" ] && [ -n "$last" ] )
        then
                echo "**************************************"
                echo "Network host field is empty"
        elif [ -z "$network" ] && ( [ -n "$first" ] && [ -n "$last" ] )
        then
                echo "**************************************"
                echo "Network host field is empty"
        elif [ -n "$last" ] && ( [ -z "$network" ] && [ -z "$first" ] )
        then
                echo "**************************************"
                echo "Network host field is empty"
                echo "First host field is empty"
        elif [ -z "$network" ] && [ -z "$first" ] && [ -z "$last" ]
        then
                echo "**************************************"
                echo "Network host field is empty"
                echo "First host field is empty"
                echo "Last host field is empty"
        fi
elif [ -n "$network" ] && [ -n "$first" ] && [ -n "$last" ]
then
        echo "****************************************************************"
        echo "Checking $network.$first-$last"
        echo "****************************************************************"
        for ip in $(seq $first $last)
        do
                ping -c 2 $network.$ip | grep -i "64 bytes" | cut -d " " -f4 | tr -d ":" | uniq 1>> ./hosts_alive 2>/dev/null &
                sleep 0.2

        done
        if [ -s ./hosts_alive ]
        then
                cat ./hosts_alive
        else
                echo "No active hosts"
        fi


fi
rm -rf ./1
rm -rf ./hosts_alive
