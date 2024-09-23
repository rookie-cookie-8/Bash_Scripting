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
------------------------------------------------------------------------------------------------------------------------------------------------------------------------
#!/bin/bash

echo "Enter the pizza size i.e. m, l, s"
read pizza
echo "Extra cheese y/n"
read cheese
echo "Extra toppings y/n"
read toppings

pizza_small=100
pizza_medium=150
pizza_large=200
extra_cheese=50
extra_toppings=30

function pizza_right {
        [[ "$pizza" =~ ^[msl]+$ ]]
}
function pizza_wrong {
        [[ ! "$pizza" =~ ^[msl]+$ ]]
}
function cheese_right {
        [[ "$cheese" =~ [yn] ]]
}
function cheese_wrong {
        [[ ! "$cheese" =~ [yn] ]]
}
function toppings_right {
        [[ "$toppings" =~ [yn] ]]
}
function toppings_wrong {
        [[ ! "$toppings" =~ [yn] ]]
}

if [ -z "$pizza" ] || [ -z "$cheese" ] || [ -z "$toppings" ]
then
        if [ -n "$pizza" ] && [ -z "$cheese" ] && [ -z "$toppings" ]
        then
                echo "****************************************"
                echo "Cheese field is empty"
                echo "Toppings field is empty"
        elif [ -n "$pizza" ] && [ -n "$cheese" ] && [ -z "$toppings" ]
        then
                echo "****************************************"
                echo "Toppings field is empty"
        elif [ -n "$pizza" ] && [ -z "$cheese" ] && [ -n "$toppings" ]
        then
                echo "****************************************"
                echo "Cheese field is empty"
        elif [ -z "$pizza" ] && [ -z "$cheese" ] && [ -n "$toppings" ]
        then
                echo "****************************************"
                echo "Pizza size field is empty"
                echo "Cheese field is empty"
        elif [ -z "$pizza" ] && [ -n "$cheese" ] && [ -n "$toppings" ]
        then
                echo "****************************************"
                echo "Pizza field is empty"
        elif [ -z "$pizza" ] && [ -n "$cheese" ] && [ -z "$toppings" ]
        then
                echo "****************************************"
                echo "Pizza size field is empty"
                echo "Toppings field is empty"
        elif [ -z "$pizza" ] && [ -z "$cheese" ] && [ -z "$toppings" ]
        then
                echo "****************************************"
                echo "Pizza size field is empty"
                echo "Cheese field is empty"
                echo "Toppings field is empty"
        else
                echo "****************************************"
                echo "Issues with user input"
        fi
elif [ -n "$pizza" ] && [ -n "$cheese" ] && [ -n "$toppings" ]
then
        if pizza_wrong || cheese_wrong || toppings_wrong
        then
                if pizza_right && cheese_wrong && toppings_wrong
                then
                        echo "**************************************"
                        echo "Cheese and toppings field can only contain y or n alphabets"
                elif pizza_right && cheese_right && toppings_wrong
                then
                        echo "**************************************"
                        echo "toppings field can only contain y or n alphabets"
                elif pizza_right && cheese_wrong && toppings_right
                then
                        echo "**************************************"
                        echo "Cheese field can only contain y or n alphabets"
                elif pizza_wrong && cheese_wrong && toppings_right
                then
                        echo "**************************************"
                        echo "Pizza size field can only contain s,m,l alphabets"
                        echo "Cheese field can only contain y or n alphabets"
                elif pizza_wrong && cheese_right && toppings_right
                then
                        echo "**************************************"
                        echo "Pizza size field can only contain s,m,l alphabets"
                elif pizza_wrong && cheese_right && toppings_wrong
                then
                        echo "**************************************"
                        echo "Pizza size field can only contain s,m,l alphabets"
                        echo "toppings field can only contain y or n alphabets"
                elif pizza_wrong && cheese_wrong && toppings_wrong
                then
                        echo "**************************************"
                        echo "Pizza size field can only contain s,m,l alphabets"
                        echo "cheese field can only contain y or n alphabets"
                        echo "toppings field can only contain y or n alphabets"
                else
                        echo "**************************************"
                        echo "Issues with user input validation"
                fi
        elif pizza_right && cheese_right && toppings_right
        then
                if [ "$pizza" == "s" ] && [ "$cheese" == "y" ] && [ "$toppings" == "y" ]
                then
                        echo "**********************************************"
                        echo "Pizza --> Small"
                        echo "Extra Cheese"
                        echo "Extra toppings"
                        total=$(($pizza_small+$extra_cheese+$extra_toppings))
                        echo "Total is --> $total"
                elif [ "$pizza" == "s" ] && [ "$cheese" == "n" ] && [ "$toppings" == "y" ]
                then
                        echo "**********************************************"
                        echo "Pizza --> Small"
                        echo "Extra toppings"
                        total=$(($pizza_small+$extra_toppings))
                        echo "Total is --> $total"
                elif [ "$pizza" == "s" ] && [ "$cheese" == "y" ] && [ "$toppings" == "n" ]
                then
                        echo "**********************************************"
                        echo "Pizza --> Small"
                        echo "Extra Cheese"
                        total=$(($pizza_small+$extra_cheese))
                        echo "Total is --> $total"
                elif [ "$pizza" == "s" ] && [ "$cheese" == "n" ] && [ "$toppings" == "n" ]
                then
                        echo "**********************************************"
                        echo "Pizza --> Small"
                        echo "Total is --> $pizza_small"
                elif [ "$pizza" == "m" ] && [ "$cheese" == "y" ] && [ "$toppings" == "y" ]
                then
                        echo "**********************************************"
                        echo "Pizza --> Medium"
                        echo "Extra Cheese"
                        echo "Extra toppings"
                        total=$(($pizza_medium+$extra_cheese+$extra_toppings))
                        echo "Total is --> $total"
                elif [ "$pizza" == "m" ] && [ "$cheese" == "n" ] && [ "$toppings" == "y" ]
                then
                        echo "**********************************************"
                        echo "Pizza --> Medium"
                        echo "Extra toppings"
                        total=$(($pizza_medium+$extra_toppings))
                        echo "Total is --> $total"
                elif [ "$pizza" == "m" ] && [ "$cheese" == "y" ] && [ "$toppings" == "n" ]
                then
                        echo "**********************************************"
                        echo "Pizza --> Medium"
                        echo "Extra cheese"
                        total=$(($pizza_medium+$extra_cheese))
                        echo "Total is --> $total"
                elif [ "$pizza" == "m" ] && [ "$cheese" == "n" ] && [ "$toppings" == "n" ]
                then
                        echo "**********************************************"
                        echo "Pizza --> Medium"
                        echo "Total is --> $pizza_medium"
                elif [ "$pizza" == "l" ] && [ "$cheese" == "y" ] && [ "$toppings" == "y" ]
                then
                        echo "**********************************************"
                        echo "Pizza --> Large"
                        echo "Extra Cheese"
                        echo "Extra toppings"
                        total=$(($pizza_large+$extra_cheese+$extra_toppings))
                        echo "Total is --> $total"
                elif [ "$pizza" == "l" ] && [ "$cheese" == "n" ] && [ "$toppings" == "y" ]
                then
                        echo "**********************************************"
                        echo "Pizza --> Large"
                        echo "Extra toppings"
                        total=$(($pizza_large+$extra_toppings))
                        echo "Total is --> $total"
                elif [ "$pizza" == "l" ] && [ "$cheese" == "y" ] && [ "$toppings" == "n" ]
                then
                        echo "**********************************************"
                        echo "Pizza --> Large"
                        echo "Extra cheese"
                        total=$(($pizza_large+$extra_cheese))
                        echo "Total is --> $total"
                elif [ "$pizza" == "l" ] && [ "$cheese" == "n" ] && [ "$toppings" == "n" ]
                then
                        echo "**********************************************"
                        echo "Pizza --> Large"
                        echo "Total is --> $pizza_large"
                fi
        fi
fi
