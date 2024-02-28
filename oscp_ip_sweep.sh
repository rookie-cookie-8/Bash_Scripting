#!/bin/bash

echo "Enter the network for example 1.1.1"
read network
echo "Enter the first host"
read first
echo "Enter the last host"
read last

if [ -z "$network" ] || [ -z "$first" ] || [ -z "$last" ]
then
        if [ -n "$network" ] && [ -n "$first" ] && [ -z "$last" ]
        then
                echo "Last host field is empty"
        elif [ -n "$network" ] && [ -z "$first" ] && [ -n "$last" ]
        then
                echo "First host field is empty"
        elif [ -z "$network" ] && [ -n "$first" ] && [ -n "$last" ]
        then
                echo "Network field is empty"
        elif [ -n "$network" ] && [ -z "$first" ] && [ -z "$last" ]
        then
                echo "First host field is empty"
                echo "Last host field is empty"
        elif [ -z "$network" ] && [ -z "$first" ] && [ -n "$last" ]
        then
                echo "Network field is empty"
                echo "First host field is empty"
        elif [ -z "$network" ] && [ -n "$first" ] && [ -z "$last" ]
        then
                echo "Network host field is empty"
                echo "Last host field is empty"
        elif [ -n "$network" ] && [ -n "$first" ] && [ -z "$last" ]
        then
                echo "Last host field is empty"
        elif [ -z "$network" ] && [ -z "$first" ] && [ -z "$last" ]
        then
                echo "Network field is empty"
                echo "First host field is empty"
                echo "Last host field is empty"
        fi
elif [ -n "$network" ] && [ -n "$first" ] && [ -n "$last" ]
then
        for host_alive in $(seq $first $last)
        do
                ping -c 1 $network.$host_alive | grep -i "64 bytes" | cut -d " " -f4 | tr -d ":" >> ./host_active &
                sleep 0.2
        done
        if [ -s ./host_active ]
        then
                echo "*********************************************"
                cat ./host_active
        else
                echo "NO active host"
        fi

fi
rm -rf ./1
rm -rf ./host_active
