#for pizza, ask user for pizza size, extra cheese and extra toppings. Based upon the input from the user, display the total price. 

#!/bin/bash

echo "Enter the pizza size i.e. L,M or S"
read size

echo "Would you like to add Extra cheese"
read cheese
echo "Would you like to add extra toppings"
read toppings

pizza_price_L=200
pizza_price_M=150
pizza_price_S=100
cheese_price=25
toppings_price=35

if [ -z "$size" ] || [ -z "$cheese" ] || [ -z "$toppings" ]
then
        if [ \( -n "$size" -a -n "$cheese" \) ] && [ -z "$toppings" ]
        then
                echo "Toppings field empty"
        elif [ \( -n "$toppings" -a -n "$cheese" \) ] && [ -z "$size" ]
        then
                echo "Pizza field empty"
        elif [ \( -n "$toppings" -a -n "$size" \) ] && [ -z "$cheese" ]
        then
                echo "Cheese field empty"
        else
                echo "Multiple user input missing"
        fi
elif [ -n "$size" ] && [ -n "$cheese" ] && [ -n "$toppings" ]
then
        if [ "$size" == "L" -o "$size" == "l" ] && [ "$cheese" == "N" -o "$cheese" == "n" ] && [ "$toppings" == "N" -o "$toppings" == "n" ]
        then
                echo "************************************************************"
                echo "Pizza size: Large"
                echo "No Extra cheese"
                echo "No Extra toppings"
                echo "Total Price: $pizza_price_L"
                echo "************************************************************"
        elif [ "$size" == "L" -o "$size" == "l" ] && [ "$cheese" == "Y" -o "$cheese" == "y" ] && [ "$toppings" == "N" -o "$toppings" == "n" ]
        then
                echo "************************************************************"
                echo "Pizza size: Large"
                echo "Extra cheese"
                echo "No Extra toppings"
                total_cost=$((pizza_price_L+cheese_price))
                echo "Total Price: $total_cost"
                echo "************************************************************"
        elif [ "$size" == "L" -o "$size" == "l" ] && [ "$cheese" == "n" -o "$cheese" == "N" ] && [ "$toppings" == "Y" -o "$toppings" == "y" ]
        then
                echo "************************************************************"
                icho "Pizza size: Large"
                echo "Extra cheese"
                echo "No Extra toppings"
                total_cost=$((pizza_price_L+toppings_price))
                echo "Total Price: $total_cost"
        elif [ "$size" == "L" -o "$size" == "l" ] && [ "$cheese" == "y" -o "$cheese" == "Y" ] && [ "$toppings" == "Y" -o "$toppings" == "y" ]
        then
                echo "************************************************************"
                echo "Pizza size: Large"
                echo "Extra cheese"
                echo "No Extra toppings"
                total_cost=$((pizza_price_L+toppings_price+cheese_price))
                echo "Total Price: $total_cost"
        elif [ "$size" == "M" -o "$size" == "m" ] && [ "$cheese" == "N" -o "$cheese" == "n" ] && [ "$toppings" == "N" -o "$toppings" == "n" ]
        then
                echo "************************************************************"
                echo "Pizza size: Large"
                echo "No Extra cheese"
                echo "No Extra toppings"
                echo "Total Price: $pizza_price_M"
                echo "************************************************************"
        elif [ "$size" == "m" -o "$size" == "M" ] && [ "$cheese" == "Y" -o "$cheese" == "y" ] && [ "$toppings" == "N" -o "$toppings" == "n" ]
        then
                echo "************************************************************"
                echo "Pizza size: Large"
                echo "Extra cheese"
                echo "No Extra toppings"
                total_cost=$((pizza_price_M+cheese_price))
                echo "Total Price: $total_cost"
                echo "************************************************************"
        elif [ "$size" == "M" -o "$size" == "m" ] && [ "$cheese" == "n" -o "$cheese" == "N" ] && [ "$toppings" == "Y" -o "$toppings" == "y" ]
        then
                echo "************************************************************"
                echo "Pizza size: Large"
                echo "Extra cheese"
                echo "No Extra toppings"
                total_cost=$((pizza_price_M+toppings_price))
                echo "Total Price: $total_cost"
        elif [ "$size" == "M" -o "$size" == "m" ] && [ "$cheese" == "y" -o "$cheese" == "Y" ] && [ "$toppings" == "Y" -o "$toppings" == "y" ]
        then
                echo "************************************************************"
                echo "Pizza size: Large"
                echo "Extra cheese"
                echo "No Extra toppings"
                total_cost=$((pizza_price_M+toppings_price+cheese_price))
                echo "Total Price: $total_cost"
        elif [ "$size" == "S" -o "$size" == "s" ] && [ "$cheese" == "N" -o "$cheese" == "n" ] && [ "$toppings" == "N" -o "$toppings" == "n" ]
        then
                echo "************************************************************"
                echo "Pizza size: Large"
                echo "No Extra cheese"
                echo "No Extra toppings"
                echo "Total Price: $pizza_price_S"
                echo "************************************************************"
        elif [ "$size" == "S" -o "$size" == "s" ] && [ "$cheese" == "Y" -o "$cheese" == "y" ] && [ "$toppings" == "N" -o "$toppings" == "n" ]
        then
                echo "************************************************************"
                echo "Pizza size: Large"
                echo "Extra cheese"
                echo "No Extra toppings"
                total_cost=$((pizza_price_S+cheese_price))
                echo "Total Price: $total_cost"
                echo "************************************************************"
        elif [ "$size" == "S" -o "$size" == "s" ] && [ "$cheese" == "n" -o "$cheese" == "N" ] && [ "$toppings" == "Y" -o "$toppings" == "y" ]
        then
                echo "************************************************************"
                echo "Pizza size: Large"
                echo "Extra cheese"
                echo "No Extra toppings"
                total_cost=$((pizza_price_S+toppings_price))
                echo "Total Price: $total_cost"
        elif [ "$size" == "S" -o "$size" == "s" ] && [ "$cheese" == "y" -o "$cheese" == "Y" ] && [ "$toppings" == "Y" -o "$toppings" == "y" ]
        then
                echo "************************************************************"
                echo "Pizza size: Large"
                echo "Extra cheese"
                echo "No Extra toppings"
                total_cost=$((pizza_price_S+toppings_price+cheese_price))
                echo "Total Price: $total_cost"
        fi

fi

