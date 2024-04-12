#user enter the filepath and filename
#script checks whether its a normal file, exists or not
# if file found, check for the keyword
#if keyword found, display the keyword with the line number where the match is found 

!/bin/bash

echo "Enter the filepath"
read filepath
echo "Enter the keyword"
read keyword

if [ -z "$filepath" ] || [ -z "$keyword" ]
then
        if [ -n "$filepath" ] && [ -z "$keyword" ]
        then
                echo "Keyword field is empty"
        elif [ -z "$filepath" ] && [ -n "$keyword" ]
        then
                echo "Filepath field is empty"
        else
                echo "Issues with the user input"
        fi
elif [ -n "$filepath" ] && [ -n "$keyword" ]
then
        if [ -e $filepath ]
        then
                if [ -f $filepath ]
                then
                        if [ -s $filepath ]
                        then
                                cat $filepath | grep -ni "$keyword" > something_found 
                                echo "*********************************"
                                if [ -s ./something_found ]
                                then
                                        echo "Would you like to view the file contents"
                                        read option 
                                        if [ "$option" == "y" ]
                                        then
                                                echo "---------------------------"
                                                cat ./something_found
                                        else
                                                echo "Bye for now"
                                        fi
                                else
                                        echo "Empty"
                                fi
                        else
                                echo "FIle found but its empty"
                        fi
                elif [ -d "$filepath" ]
                then
                        echo "Its a directory, cannot do anything"
                else
                        echo "Cannot recognize, something is wrong"
                fi
        else
                echo "FIle not found"
        fi
fi
rm -rf ./something_found
rm -rf ./1
