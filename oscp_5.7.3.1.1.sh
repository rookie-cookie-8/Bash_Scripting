#oscp exercise for network sweep 

#!/bin/bash

echo "Enter the network i.e 1.1.1"
read network
echo "Enter the first host"
read first
echo "Enter the last host"
read last

if [ -z "$network" ] || [ -z "$first" ] || [ -z "$last" ]
then
        if [ -n "$network" ] && [ -z "$first" ] && [ -z "$last" ]
        then
                echo "*********************************************"
                echo "First host field empty"
                echo "Last host field empty"
                echo "*********************************************"
        elif [ -n "$network" ] && [ -n "$first" ] && [ -z "$last" ]
        then
                echo "*********************************************"
                echo "Last host field empty"
                echo "*********************************************"
        elif [ -n "$network" ] && [ -z "$first" ] && [ -n "$last" ]
        then
                echo "*********************************************"
                echo "First host field empty"
                echo "*********************************************"
        elif [ -z "$network" ] && [ -z "$first" ] && [ -n "$last" ]
        then
                echo "*********************************************"
                echo "Network field empty"
                echo "First host field empty"
                echo "*********************************************"
        elif [ -z "$network" ] && [ -n "$first" ] && [ -n "$last" ]
        then
                echo "*********************************************"
                echo "Network field empty"
        elif [ -z "$network" ] && [ -n "$first" ] && [ -z "$last" ]
        then
                echo "*********************************************"
                echo "Network field empty"
                echo "Last host field empty"
                echo "*********************************************"
        elif [ -z "$network" ] && [ -z "$first" ] && [ -z "$last" ]
        then
                echo "*********************************************"
                echo "Network field empty"
                echo "First host field empty"
                echo "Last host field empty"
                echo "*********************************************"
        else
                echo "*********************************************"
                echo "Issues with the user input"
                echo "*********************************************"
        fi
elif [ -n "$network" ] && [ -n "$first" ] && [ -n "$last" ]
then
        for host_alive in $(seq $first $last)
        do
                echo "******Checking $network.$host_alive************"
                ping -c 1 $network.$host_alive | grep -i "64 bytes" | cut -d " " -f4 >> ./network-sweep &
                sleep 0.2

        done
        if [ -s ./network-sweep ]
        then
                echo "***********************************************"
                echo "*****Hosts found*****"
                cat network-sweep
        else
                echo "***********************************************"
                echo "*****No Hosts found*****"
        fi
fi
rm -rf ./1
rm -rf ./network-sweep
