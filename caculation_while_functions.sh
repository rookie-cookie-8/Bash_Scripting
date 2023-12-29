#Script --> Calculations, functions and while loop 

#!/bin/bash

function calculation {
        echo "*****************************************************"
        echo "Enter your Choice"
        echo "Press 1 for Addition"
        echo "Press 2 for Subtraction"
        echo "Press 3 for Multiplication"
        echo "Press 4 for Divisor"
        echo "Press 5 for Remainder"
        echo "Press 6 for Power"
        read choice
        echo "*****************************************************"
        if [ "$choice" == "1" ]
        then
                ans=$((first+second))
                echo "$first plus $second is: $ans"
        elif [ "$choice" == "2" ]
        then
                ans=$((first-second))
                echo "$first Subtract $second is: $ans"
        elif [ "$choice" == "3" ]
        then
                ans=$((first*second))
                echo "$first Multiply $second is: $ans"
        elif [ "$choice" == "4" ]
        then
                if [ $first -ge $second ]
                then
                        ans=$((first/second))
                        echo "$first Divide $second is: $ans --> Divisor"
                else
                        echo "Second number cannot be greater than first"
                fi
        elif [ "$choice" == "5" ]
        then
                if [ $first -ge $second ]
                then
                        ans=$((first%second))
                        echo "$first Divide $second is: $ans --> Quotient"
                else
                        echo "Second number cannot be greater than first"
                fi
        elif [ "$choice" == "6" ]
        then
                ans=$((first**second))
                echo "$first Power $second is: $ans"
        fi
}
function input {
        echo "Enter the First number"
        read first

        echo "Enter the second number"
        read second

        if [ -z "$first" ] || [ -z "$second" ]
        then
                if [ -n "$first" ] && [ -z "$second" ]
                then
                        echo "Second number field is empty"
                elif [ -z "$first" ] && [ -n "$second" ]
                then
                        echo "First number field is empty"
                else
                        echo "Something wrong with user input"
                fi
        fi
}

input
if [ -n "$first" ] && [ -n "$second" ]
then
        calculation
        echo "***************************************************"
        echo "Would you like to calculation again: Y or N"
        read choice
        while [ "$choice" == "Y" ]
        do
                input
                calculation
                echo "Would you like to calculation again: Y or N"
                read choice
                if [ "$choice" == "Y" ]
                then
                        continue
                else
                        break
                fi
        done
fi
---------------------------------------------------------------------------------------------------------------------------------------------------
#!/bin/bash

input(){
        echo "Enter the first number"
        read first
        echo "Enter the second number"
        read second

        if [ -z "$first" ] || [ -z "$second" ]
        then
                if [ -n "$first" ] && [ -z "$second" ]
                then
                        echo "Second field empty"
                        cont
                elif [ -z "$first" ] && [ -n "$second" ]
                then
                        echo "First field empty"
                        cont
                else
                        echo "Both field empty"
                        cont
                fi
        fi
        }
calc() {
        if [ -n "$first" ] && [ -n "$second" ]
        then
                echo "Press 1 for addition"
                echo "Press 2 for Subtraction"
                echo "Press 3 for multiplication"
                echo "Press 4 for Power"
                read choice
                if [ "$choice" == "1" ]
                then
                        ans=$((first+second))
                        echo "Result is: $ans"
                        echo "*******************************************"
                        con
                elif [ "$choice" == "2" ]
                then
                        ans=$((first-second))
                        echo "Result is: $ans"
                        echo "*******************************************"
                        con
                elif [ "$choice" == "3" ]
                then
                        ans=$((first*second))
                        echo "Result is: $ans"
                        echo "*******************************************"
                        con
                elif [ "$choice" == "4" ]
                then
                        ans=$((first**second))
                        echo "Result is: $ans"
                        echo "*******************************************"
                        con
                fi
        fi
}
con(){
        echo "Would you like to continue with calculaions: Y or N"
        read answer
        if [ "$answer" == "Y" ]
        then
                input
                calc
        else
                echo "Bye for now"
        fi
}
cont () {
        echo "Would you like to continue: Y or N"
        read answer_1
        if [ "$answer_1" == "Y" ]
        then
                input
        else
                echo "bye"
        fi
}
input
calc
----------------------------------------------------------------------------------------------------------------------------------------------------------------
#!/bin/bash

function user_input() {
        echo "Enter the first number"
        read first

        echo "Enter the second number"
        read second
}
function user_input_check(){
        if [ -z "$first" ] || [ -z "$second" ]
        then
                if [ -n "$first" ] && [ -z "$second" ]
                then
                        echo "Second number field is empty"
                elif [ -z "$first" ] && [ -n "$second" ]
                then
                        echo "First number field is empty"
                else
                        echo "Soemthing wrong with user input"
                fi
        fi
        calc
}

function calc(){
        if [ -n "$first" ] && [ -n "$second" ]
        then
                echo "Press 1: for Addition"
                echo "Press 2: for Subraction"
                echo "Press 3: for Multiplication"
                echo "Press 4: for Power"
                echo "Press 5: for Remainder"
                echo "Press 6: for Quotient"
                read choice
                if [ "$choice" == "1" ]
                then
                        echo "*********************************"
                        ans=$((first+second))
                        echo "$first plus $second: $ans"
                        do_it_again
                elif [ "$choice" == "2" ]
                then
                        echo "*********************************"
                        ans=$((first-second))
                        echo "$first subtract $second: $ans"
                        do_it_again
                elif [ "$choice" == "3" ]
                then
                        echo "*********************************"
                        ans=$((first*second))
                        echo "$first multiply $second: $ans"
                        do_it_again
                elif [ "$choice" == "4" ]
                then
                        echo "*********************************"
                        ans=$((first**second))
                        echo "$first power $second: $ans"
                        do_it_again
                elif [ "$choice" == "5" ]
                then
                        echo "*********************************"
                        ans=$((first%second))
                        echo "$first Remainder $second: $ans"
                        do_it_again
                elif [ "$choice" == "6" ]
                then
                        echo "*********************************"
                        ans=$((first/second))
                        echo "$first quotient $second: $ans"
                        do_it_again
                fi

        fi

}
function do_it_again(){
        echo "**********************************************"
        echo "Would you like to continue: Y/y or N/n"
        read answer
        if [ "$answer" == "Y" ] || [ "$answer" == "y" ]
        then
                user_input
                user_input_check
        else
                echo "Bye"
        fi
}


user_input
user_input_check

*****************************************************************************************************************************************************************

#!/bin/bash

function user-input {
        echo "Enter the first number"
        read first
        echo "Enter the second number"
        read second
}
function user-input-2 {
        echo "*******************************************"
        echo "Would you like to continue: Y/y or N/n"
        read option
        if [ "$option" == "Y" ] || [ "$option" == "y" ]
        then
                user-input
        else
                echo "BYe"
        fi

}
function validation-1 {
        if [ -z "$first" ] || [ -z "$second" ]
        then
                if [ -z "$first" ] && [ -n "$second" ]
                then
                        echo "First number field is empty"
                        user-input-2
                elif [ -n "$first" ] && [ -z "$second" ]
                then
                        echo "Second number field is empty"
                        user-input-2
                else
                        echo "User input missing"
                        user-input-2
                fi
        fi
}
function validation-2 {
        if [ -n "$first" ] && [ -n "$second" ]
        then
                echo "*****************************"
                echo "Addition --> Press 1"
                echo "Subtraction --> Press 2"
                echo "Multiplication --> Press 3"
                echo "*****************************"
                read choice
                if [ "$choice" == "1" ]
                then
                        ans=$((first+second))
                        echo "$first + $second --> $ans"
                elif [ "$choice" == "2" ]
                then
                        ans=$((first-second))
                        echo "$first - $second --> $ans"
                elif [ "$choice" == "3" ]
                then
                        ans=$((first*second))
                        echo "$first * $second --> $ans"
                fi
                again


        fi
}
function again {
        echo "*******************************************"
        echo "Would you like to continue: Y/y or N/n"
        read option
        if [ "$option" == "Y" ] || [ "$option" == "y" ]
        then
                user-input
                validation-1
                validation-2
        else
                echo "Bye"
        fi

}
user-input
validation-1
validation-2


*****************************************************************************************************************************************************************

#!/bin/bash

function user_input {
        echo "Enter the first number"
        read first
        echo "Enter the second number"
        read second
}

function validation_1 {
        if [ -z "$first" ] ||  [ -z "$second" ]
        then
                if [ -n "$first" ] && [ -z "$second" ]
                then
                        echo "Second number field is empty"
                        again
                elif [ -z "$first" ] && [ -n "$second" ]
                then
                        echo "First number field is empty"
                        again
                else
                        echo "User input is missing"
                        again
                fi
        fi
        }

function validation_2 {
        if [ -n "$first" ] && [ -n "$second" ]
        then
                echo "*************************************"
                echo "First number is: $first"
                echo "Second number is: $second"
                echo "*************************************"
                operation
                again
        fi
        }
function operation {
        echo "Press 1 for Addition"
        echo "Press 2 for Subtraction"
        echo "Press 3 for Multiplication"
        read option
        if [ "$option" == "1" ]
        then
                ans=$((first+second))
                echo "$first plus $second is: $ans"
        elif [ "$option" == "2" ]
        then
                ans=$((first-second))
                echo "$first subtract $second is: $ans"
        elif [ "$option" == "3" ]
        then
                ans=$((first*second))
                echo "$first multiply $second is: $ans"
        else
                echo "Invalid choice"
        fi
}
function again {
        echo "*********************************************"
        echo "Would you like to do it once again. Y/y or N/n"
        read answer
        if [ "$answer" == "Y" ] || [ "$answer" == "y" ]
        then
                user_input
                validation_1
                validation_2
                operating
        elif [ "$answer" == "n" ] || [ "$answer" == "N" ]
        then
                echo "You ask to exit, so bye"
        else
                echo "Invalid choice, so bye for now"
        fi
        }
user_input
validation_1
validation_2
