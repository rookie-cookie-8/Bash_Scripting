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


---------------------------------------------------------------------------------------------------------------------------------------------------------------------
#advanced
#!/bin/bash

echo "Enter the network part"
read network
echo "Enter the first host"
read first
echo "Enter the last host"
read last

function network_check {
        [[ "$network" =~ ^[0-9.]+$ ]]
}
function network_wrong {
        [[ ! "$network" =~ ^[0-9.]+$ ]]
}
function first_check {
        [[ "$first" =~ ^[0-9]+$ ]]
}
function first_wrong {
        [[ ! "$first" =~ ^[0-9]+$ ]]
}
function last_check {
        [[ "$last" =~ ^.?[0-9]+$ ]]
}
function last_wrong {
        [[ ! "$last" =~ ^[0-9]+$ ]]
}


if [ -z "$network" ] || [ -z "$first" ] || [ -z "$last" ]
then
        if [ -n "$network" ] && [ -z "$first" ] && [ -z "$last" ]
        then
                echo "**************************************"
                echo "First host field is empty"
                echo "Last host field is empty"
        elif [ -n "$network" ] && [ -n "$first" ] && [ -z "$last" ]
        then
                echo "**************************************"
                echo "Last host field is empty"
        elif [ -n "$network" ] && [ -z "$first" ] && [ -n "$last" ]
        then
                echo "**************************************"
                echo "First host field is empty"
        elif [ -z "$network" ] && [ -n "$first" ] && [ -n "$last" ]
        then
                echo "**************************************"
                echo "Network field is empty"
        elif [ -z "$network" ] && [ -z "$first" ] && [ -n "$last" ]
        then
                echo "**************************************"
                echo "Network field is empty"
                echo "First host field is empty"
        elif [ -z "$network" ] && [ -n "$first" ] && [ -z "$last" ]
        then
                echo "**************************************"
                echo "Network field is empty"
                echo "Last host field is empty"
        elif [ -z "$network" ] && [ -z "$first" ] && [ -z "$last" ]
        then
                echo "**************************************"
                echo "Network field is empty"
                echo "First host field is empty"
                echo "Last host field is empty"
        else
                echo "**************************************"
                echo "Issues with the user input"
        fi
elif [ -n "$network" ] && [ -n "$first" ] && [ -n "$last" ]
then
        if network_wrong || first_wrong || last_wrong
        then
                if network_check && first_wrong && last_wrong
                then
                        echo "***********************************"
                        echo "First host field can only contain numeric digits"
                        echo "Last host field can only contain numeric digits"
                elif network_check && first_check && last_wrong
                then
                        echo "***********************************"
                        echo "Last host field can only contain numeric digits"
                elif network_check && first_wrong && last_check
                then
                        echo "***********************************"
                        echo "First host field can only contain numeric digits"
                elif network_wrong && first_check && last_check
                then
                        echo "***********************************"
                        echo "Network field can only contain numeric digits"
                elif network_wrong && first_wrong && last_check
                then
                        echo "***********************************"
                        echo "Network field can only contain numeric digits"
                        echo "First host field can only contain numeric digits"
                elif network_wrong && first_check && last_wrong
                then
                        echo "***********************************"
                        echo "Network field can only contain numeric digits"
                        echo "Last host field can only contain numeric digits"
                elif network_wrong && first_wrong && last_wrong
                then
                        echo "***********************************"
                        echo "Network field can only contain numeric digits"
                        echo "First host field can only contain numeric digits"
                        echo "Last host field can only contain numeric digits"
                fi
        elif network_check && first_check && last_check
        then
                for host_alive in $(seq $first $last)
                do
                        echo "*******Checking $network.$host_alive**************"
                        ping -c 1 $network.$host_alive | grep -i "64 bytes" | cut -d " " -f4 | tr -d ":" 1>> ./host_alive_lists
                        sleep 0.5
                done
                if [ -s ./host_alive_lists ]
                then
                        echo "************************************"
                        cat ./host_alive_lists
                else
                        echo "************************************"
                        echo "No active host found"
                fi
        fi
fi
rm -rf ./1
rm -rf ./host_alive_lists

