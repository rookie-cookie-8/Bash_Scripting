#script to check whether file or directory exist or not. 
#If file or directory exist, display the permissions
#!/bin/bash

echo "Enter the path"
read path

echo "Enter the filename"
read filename

if [ -z "$path" ]  || [ -z "$filename" ]
then
        if [ -n "$path" ] && [ -z "$filename" ]
        then
                echo "Filename field is empty"
        elif [ -z "$path" ] && [ -n "$filename" ]
        then
                echo "Path field is empty"
        else
                echo "Both field is empty"
        fi

elif [ -n "$path" ] && [ -n "$filename" ]
then
        if [ -e "$path$filename" ]
        then
                if [ ! -r $path$filename ] && [ ! -w $path$filename ] && [ ! -x $path$filename ]
                then
                        echo "NO RWX permission"
                elif [ -x $path$filename ] && ( [ ! -r $path$filename ] && [ ! -w $path$filename ] )
                then
                        echo "Execute permission"
                        echo "No RW permission"
                elif [ -w $path$filename ] && ( [ ! -r $path$filename ] && [ ! -x $path$filename ] )
                then
                        echo "Write permission"
                        echo "No RX permission"
                elif [ ! -r $path$filename ] && ( [ -w $path$filename ] && [  -x $path$filename ] )
                then
                        echo "WX permission"
                        echo "No X permission"
                elif [ -r $path$filename ] && ( [ ! -w $path$filename ] && [ ! -x $path$filename ] )
                then
                        echo "R permission"
                        echo "No WX permission"
                elif [ ! -w $path$filename ] && ( [ -r $path$filename ] && [ -x $path$filename ] )
                then
                        echo "RX permission"
                        echo "No W permission"
                elif [ ! -x $path$filename ] && ( [ -r $path$filename ] && [ -w $path$filename ] )
                then
                        echo "RW permission"
                        echo "No x permission"
                else
                        echo "Full permission"
                fi
        else
                echo "File not found"
        fi
fi

--------------------------------------------------------------------------------------------------------------------------------------------------------

#!/bin/bash

echo "Enter the path"
read path

echo "Enter the filename"
read filename


if [ -z "$path" ] || [ -z "$filename" ]
then
        if [ -n "$path" ] && [ -z "$filename" ]
        then
                echo "Filename field empty"
        elif [ -z "$path" ] && [ -n "$filename" ]
        then
                echo "Path field empty"
        else
                echo "Both field empty"

        fi
elif [ -n "$path" ] && [ -n "$filename" ]
then
        if [ -e "$path$filename" ]
        then
                if [ -d "$path$filename" ]
                then
                        if [ -x "$path$filename" ] && ( ! [ -r "$path$filename" ] && ! [ -w "$path$filename" ] )
                        then
                                echo "Its a directory with execute permission"
                                echo "No rw permission"
                        elif [ -w "$path$filename" ] && ( ! [ -r "$path$filename" ] && ! [ -x "$path$filename" ] )
                        then
                                echo "Its a directory with write permission"
                                echo "No rx permission"
                        elif [ ! -r "$path$filename" ] && ( [ -w "$path$filename" ] && [ -x "$path$filename" ] )
                        then
                                echo "Its a directory with write and excute permission"
                                echo "No r permission"
                        elif [ -r "$path$filename" ] && ( ! [ -w "$path$filename" ] && ! [ -x "$path$filename" ] )
                        then
                                echo "Its a directory read permission"
                                echo "No wx permission"
                        elif [ ! -w "$path$filename" ] && ( [ -r "$path$filename" ] && [ -x "$path$filename" ] )
                        then
                                echo "Its a directory with read and excute permission"
                                echo "No w permission"
                        elif [ ! -x "$path$filename" ] && ( [ -r "$path$filename" ] && [ -w "$path$filename" ] )
                        then
                                echo "Its a directory with read and write permission"
                                echo "No x permission"
                        elif [ -r "$path$filename" ] && [ -w "$path$filename" ] && [ -x "$path$filename" ]
                        then
                                echo "Its a directory with full permission"
                        else
                                echo "Its a directory with no permission"
                        fi
                elif [ -f "$path$filename" ]
                then
                        if [ -x "$path$filename" ] && ( ! [ -r "$path$filename" ] && ! [ -w "$path$filename" ] )
                        then
                                echo "Its a regular file with excute permission"
                                echo "No read and write permission"
                        elif [ -w "$path$filename" ] && ( ! [ -r "$path$filename" ] && ! [ -x "$path$filename" ] )
                        then
                                echo "Its a regular file with write permission"
                                echo "No read and excute permission"
                        elif [ ! -r "$path$filename" ] && ( [ -w "$path$filename" ] && [ -x "$path$filename" ] )
                        then
                                echo "Its a regular file with write  and excute permission"
                                echo "No read permission"
                        elif [ -r "$path$filename" ] && ( ! [ -w "$path$filename" ] && ! [ -x "$path$filename" ] )
                        then
                                echo "Its a regular file with read permission"
                                echo "No wx permission"
                        elif [ ! -w "$path$filename" ] && ( [ -r "$path$filename" ] && [ -x "$path$filename" ] )
                        then
                                echo "Its a regular file with read and excute permission"
                                echo "No w permission"
                        elif [ ! -x "$path$filename" ] && ( [ -r "$path$filename" ] && [ -w "$path$filename" ] )
                        then
                                echo "Its a regular file with read and excute  permission"
                                echo "No w permission"
                        elif [ ! -x "$path$filename" ] && ( [ -r "$path$filename" ] && [ -w "$path$filename" ] )
                        then
                                echo "Its a regular file with read and write  permission"
                                echo "No x permission"
                        elif [ -r "$path$filename" ] && [ -w "$path$filename" ] && [ -x "$path$filename" ]
                        then
                                echo "Its a regular file with all permission"
                        else
                                echo "Its a regular file with no permission"


                        fi
                else
                        echo "Cannot recognize the file"
                fi
        else
                echo "No file found"
        fi
fi
---------------------------------------------------------------------------------------------------------------------------------------------------------------
#!/bin/bash

echo "Enter the absolute path"
read path
echo "Enter the file name"
read file

if [ -z "$path" ] || [ -z "$file" ]
then
        if [ -z "$path" ] && [ -n "$file" ]
        then
                echo "Path field is empty"
        elif [ -n "$path" ] && [ -w "$file" ]
        then
                echo "Filename field is empty"
        else
                echo "User input missing"
        fi

elif [ -n "$path" ] && [ -n "$file" ]
then
        if [ -e $path$file ]
        then
                if [ -f $path$file ]
                then
                        if [ ! -r $path$file ] && [ ! -w "$path$file" ] && [ ! -x "$path$file" ]
                        then
                                echo "*****************************"
                                echo "No Read permission"
                                echo "No Write permission"
                                echo "No Execute permission"
                        elif [ -x $path$file ] && ( [ ! -w "$path$file" ] && [ ! -r "$path$file" ] )
                        then
                                echo "*****************************"
                                echo "No Read permission"
                                echo "No Write permission"
                                echo "Execute permission"
                        elif [ -w $path$file ] && ( [ ! -r "$path$file" ] && [ ! -x "$path$file" ] )
                        then
                                echo "*****************************"
                                echo "No Read permission"
                                echo "Write permission"
                                echo "No Execute permission"
                        elif [ ! -r $path$file ] && ( [ -w "$path$file" ] && [ -x "$path$file" ] )
                        then
                                echo "*****************************"
                                echo "No Read permission"
                                echo "Write permission"
                                echo "Execute permission"
                        elif [ -r $path$file ] && ( [ ! -w "$path$file" ] && [ ! -x "$path$file" ] )
                        then
                                echo "*****************************"
                                echo "Read permission"
                                echo "No Write permission"
                                echo "No Execute permission"
                        elif [ ! -w $path$file ] && ( [ -r "$path$file" ] && [ -x "$path$file" ] )
                        then
                                echo "*****************************"
                                echo "Read permission"
                                echo "No Write permission"
                                echo "Execute permission"
                        elif [ ! -x $path$file ] && ( [ -r "$path$file" ] && [ -w "$path$file" ] )
                        then
                                echo "*****************************"
                                echo "Read permission"
                                echo "Write permission"
                                echo "No Execute permission"
                        else
                                echo "**********************************"
                                echo "Read permission"
                                echo "Write permission"
                                echo "Execute Permission"
                        fi
                elif [ -d $path$file ]
                then
                        if [ ! -r $path$file ] && [ ! -w "$path$file" ] && [ ! -x "$path$file" ]
                        then
                                echo "*****************************"
                                echo "No Read permission"
                                echo "No Write permission"
                                echo "No Execute permission"
                        elif [ -x $path$file ] && ( [ ! -w "$path$file" ] && [ ! -r "$path$file" ] )
                        then
                                echo "*****************************"
                                echo "No Read permission"
                                echo "No Write permission"
                                echo "Execute permission"
                        elif [ -w $path$file ] && ( [ ! -r "$path$file" ] && [ ! -x "$path$file" ] )
                        then
                                echo "*****************************"
                                echo "No Read permission"
                                echo "Write permission"
                                echo "No Execute permission"
                        elif [ ! -r $path$file ] && ( [ -w "$path$file" ] && [ -x "$path$file" ] )
                        then
                                echo "*****************************"
                                echo "No Read permission"
                                echo "Write permission"
                                echo "Execute permission"
                        elif [ -r $path$file ] && ( [ ! -w "$path$file" ] && [ ! -x "$path$file" ] )
                        then
                                echo "*****************************"
                                echo "Read permission"
                                echo "No Write permission"
                                echo "No Execute permission"
                        elif [ ! -w $path$file ] && ( [ -r "$path$file" ] && [ -x "$path$file" ] )
                        then
                                echo "*****************************"
                                echo "Read permission"
                                echo "No Write permission"
                                echo "Execute permission"
                        elif [ ! -x $path$file ] && ( [ -r "$path$file" ] && [ -w "$path$file" ] )
                        then
                                echo "*****************************"
                                echo "Read permission"
                                echo "Write permission"
                                echo "No Execute permission"
                        else
                                echo "**********************************"
                                echo "Read permission"
                                echo "Write permission"
                                echo "Execute Permission"
                        fi
                fi
        else
                echo "*****************************"
                echo "Invalid path"
                echo "File not found"
        fi
fi

