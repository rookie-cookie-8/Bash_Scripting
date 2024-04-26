#oscp 5.7.3.1.1 Exercise
#network sweep
#ask user to input the network, first and last host

#!/bin/bash

echo "Enter the network i.e. 1.1.1"
read network
echo "Enter the first host"
read first
echo "Enter the last host"
read last

if [ -z "$network" ] || [ -z "$first" ] || [ -z "$last" ]
then
        if [ -n "$network" ] && [ -z "$first" ] && [ -z "$last" ]
        then
                echo "***********************************************"
                echo "First host field is empty"
                echo "Last host field is empty"
        elif [ -n "$network" ] && [ -n "$first" ] && [ -z "$last" ]
        then
                echo "***********************************************"
                echo "Last host field is empty"
        elif [ -n "$network" ] && [ -z "$first" ] && [ -n "$last" ]
        then
                echo "***********************************************"
                echo "First host field is empty"
        elif [ -z "$network" ] && [ -n "$first" ] && [ -n "$last" ]
        then
                echo "***********************************************"
                echo "Network field is empty"
        elif [ -z "$network" ] && [ -n "$first" ] && [ -z "$last" ]
        then
                echo "***********************************************"
                echo "Network field is empty"
                echo "Last host field is empty"
        elif [ -z "$network" ] && [ -z "$first" ] && [ -n "$last" ]
        then
                echo "***********************************************"         
                echo "Network field is empty"                                  
                echo "First host field is empty"                               
        elif [ -z "$network" ] && [ -z "$first" ] && [ -z "$last" ]            
        then
                echo "***********************************************"
                echo "Network field is empty"
                echo "First host field is empty"
                echo "Last host field is empty"
        fi
elif [ -n "$network" ] && [ -n "$first" ] && [ -n "$last" ]
then
        echo "***********************************************"
        echo "*****Network Sweep $network.$first-$last*******"
        sleep 0.5
        for host_alive in $(seq $first $last)
        do
                ping -c 1 $network.$host_alive | grep -i "64 bytes" | cut -d " " -f4 | tr -d ":" >> ./host_responding &
                sleep 0.1
        done
        if [ -s ./host_responding ]
        then
                cat ./host_responding
        else
                echo "No active hosts found"
        fi

fi
rm -rf ./1
rm -rf ./host_responding
