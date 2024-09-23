#user input --> credit score and total cost of the house
#based upon the credit score, down payment is calculated

#!/bin/bash

echo "Enter the credit score"
read credit_score
echo "Enter the house amount"
read house_amount

if [ -z "$credit_score" ] || [ -z "$house_amount" ]
then
        if [ -n "$credit_score" ] && [ -z "$house_amount" ]
        then
                echo "*****************************************"
                echo "House price field is empty"
        elif [ -z "$credit_score" ] && [ -n "$house_amount" ]
        then
                echo "*****************************************"
                echo "Credit score field is empty"
        elif [ -z "$credit_score" ] && [ -z "$house_amount" ]
        then
                echo "*****************************************"
                echo "Credit score field is empty"
                echo "House price field is empty"
        else
                echo "*****************************************"
                echo "Issues with the user input"

        fi
elif [ -n "$credit_score" ] && [ -n "$house_amount" ]
then
        if [ "$credit_score" -ge 750 ]
        then
                echo "**************************************"
                ans=$((house_amount*20/100))
                echo "Down payment require --> $ans"
        elif [ "$credit_score" -lt 750 ] && [ "$credit_score" -ge 650 ]
        then
                echo "**************************************"
                ans=$((house_amount*30/100))
                echo "Down payment require --> $ans"
        else
                echo "**************************************"
                echo "Try again later"

        fi
fi

-------------------------------------------------------------------------------------------------------------------------------------------
#!/bin/bash

echo "Enter the total cost of the house"
read total
echo "Enter the credit score"
read credit

if [ -z "$total" ] || [ -z "$credit" ]
then
        if [ -n "$total" ] && [ -z "$credit" ]
        then
                echo "********************************"
                echo "Credit score field is empty"
        elif [ -z "$total" ] && [ -n "$credit" ]
        then
                echo "********************************"
                echo "Total cost field is empty"
        elif [ -z "$total" ] && [ -z "$credit" ]
        then
                echo "********************************"
                echo "Total cost field is empty"
                echo "Credit score field is empty"
        else
                echo "********************************"
                echo "Issues with the user input"
        fi

elif [ -n "$total" ] && [ -n "$credit" ]
then
        if [[ "$total" =~ ^[0-9]+$ ]] && [[ "$credit" =~ ^[0-9]+$ ]]
        then
                if [ "$credit" -ge 750 ]
                then
                        down_payment=$(($total*10/100))
                        echo "*************************************"
                        echo "Total cost of the house --> $total"
                        echo "Credit score --> $credit"
                        echo "Down payment --> $down_payment"
                elif [ "$credit" -lt 750 ] && [ "$credit" -ge 650 ]
                then
                        down_payment=$(($total*20/100))
                        echo "*************************************"
                        echo "Total cost of the house --> $total"
                        echo "Credit score --> $credit"
                        echo "Down payment --> $down_payment"
                elif [ "$credit" -lt 650 ] && [ "$credit" -ge 600 ]
                then
                        down_payment=$(($total*30/100))
                        echo "*************************************"
                        echo "Total cost of the house --> $total"
                        echo "Credit score --> $credit"
                        echo "Down payment --> $down_payment"
                else
                        echo "*************************************"
                        echo "Credit score is low"
                        echo "Cannot process the application"
                fi
        elif [[ ! "$total" =~ ^[0-9]+$ ]] || [[ ! "$credit" =~ ^[0-9]+$ ]]
        then
                if [[ ! "$total" =~ ^[0-9]+$ ]] && [[ "$credit" =~ ^[0-9]+$ ]]
                then
                        echo "********************************************"
                        echo "Total cost of the house field can only contain numeric digits"
                elif [[ "$total" =~ ^[0-9]+$ ]] && [[ ! "$credit" =~ ^[0-9]+$ ]]
                then
                        echo "********************************************"
                        echo "Credit score field can only contain numeric digits"
                elif [[ ! "$total" =~ ^[0-9]+$ ]] && [[ ! "$credit" =~ ^[0-9]+$ ]]
                then
                        echo "********************************************"
                        echo "Total cost of the house field can only contain numeric digits"
                        echo "Credit score field can only contain numeric digits"
                else
                        echo "********************************************"
                        echo "Something went wrong"
                fi
        fi
fi
---------------------------------------------------------------------------------------------------------------------------------------------------------------
#!/bin/bash

echo "Enter the total cost of the house"
read total
echo "Enter the credit score"
read credit

function total_right {
        [[ $total =~ ^[0-9]+$ ]]
}
function total_wrong {
        [[ ! $total =~ ^[0-9]+$ ]]
}
function credit_right {
        [[ $credit =~ ^[0-9]+$ ]]
}
function credit_wrong {
        [[ ! $credit =~ ^[0-9]+$ ]]
}
if [ -z "$total" ] || [ -z "$credit" ]
then
        if [ -n "$total" ] && [ -z "$credit" ]
        then
                echo "**********************************"
                echo "Credit score field is empty"
        elif [ -z "$total" ] && [ -n "$credit" ]
        then
                echo "**********************************"
                echo "Total cost field is empty"
        elif [ -z "$total" ] && [ -z "$credit" ]
        then
                echo "**********************************"
                echo "Total cost field is empty"
                echo "Credit score field is empty"
        else
                echo "**********************************"
                echo "Issues with the user input"
        fi
elif [ -n "$total" ] && [ -n "$credit" ]
then
        if total_wrong || credit_wrong
        then
                if total_right && credit_wrong
                then
                        echo "**********************************"
                        echo "Credit score field must contain only digits"
                elif total_wrong && credit_right
                then
                        echo "**********************************"
                        echo "Total cost field must contain only digits"
                elif total_wrong && credit_wrong
                then
                        echo "**********************************"
                        echo "Total cost field must contain only digits"
                        echo "Credit score field must contain only digits"
                else
                        echo "**********************************"
                        echo "Issues with user input validation"
                fi
        elif total_right && credit_right
        then
                if [ $credit -gt 750 ] || [ $credit -eq 750 ]
                then
                        echo "************************************"
                        down=$(($total*10/100))
                        echo "Total cost of the house --> $total"
                        echo "Down payment --> $down"
                elif [ $credit -gt 650 ] || [ $credit -eq 650 ]
                then
                        echo "************************************"
                        down=$(($total*20/100))
                        echo "Total cost of the house --> $total"
                        echo "Down payment --> $down"
                elif [ $credit -gt 600 ] || [ $credit -eq 600 ]
                then
                        echo "************************************"
                        down=$(($total*30/100))
                        echo "Total cost of the house --> $total"
                        echo "Down payment --> $down"
                else
                        echo "************************************"
                        echo "Cannot proceed the application"
                fi
        fi
fi
