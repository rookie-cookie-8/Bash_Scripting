#basic script to find out the length of the string
#!/bin/bash

echo "Enter the name"
read name

echo "The length of your name is ${#name}"

---------------------------------------------------------------------------------------------------------
#!/bin/bash

echo "Enter the name"
read name


if [ ${#name} -gt 10 ]
then
        echo "Your name is $name"
else
        echo "Bye"
fi
