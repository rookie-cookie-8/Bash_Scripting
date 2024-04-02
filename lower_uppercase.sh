#!/bin/bash

echo "Enter the name"
read name


if [ ${#name} -gt 10 ]
then
        echo "Your name is ${name^^}"        #uppercase
        echo "Your name is ${name,,}"        #lowercase
else
        echo "Bye"
fi
