#This script is to understand how variables can be decalared
#SYSTEM Defined Variables: $PWD, $HOME, $BASH, $BASH_VERSION, $0, $SHELL, 
#$HOSTNAME, $HOSTTYPE, $PATH, $LANG, $USER, $LOGNAME, $UID, $RANDOM,
# $HOSTSIZE, HISTFILESIZE, $HISTFILE, HISTIGNORE, $HISTCONTROL, $HISTTIMEFORMAT

#!/bin/bash


a-10
echo $a
echo "*******************************************************"
b="hrishi"
echo $b
echo "*******************************************************"
c=$(date)
echo $c
echo "*******************************************************"
d=$(date | cut -d " " -f1-3)
echo $d
echo "*******************************************************"
e=$(cat /etc/passwd | head -n 3)
echo $e
echo "*******************************************************"
echo "Current working directory: $PWD"
echo "*******************************************************"
f=$USER
echo "Current login user is : $f"
echo "*******************************************************"
echo "Current login user: $(whoami)"
echo "*******************************************************"
a=$USER
echo $a
"*******************************************************
a=/etc/ssh/sshd_config
cat $a

