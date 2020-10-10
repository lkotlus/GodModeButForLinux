#!/bin/bash

#We actually about to do the admins!

echo '*_____________________________________*'
echo '      Would you like correct the       ' 
echo '      sudo and admin group?(y/n)       '
echo '*_____________________________________*'

read -p 'y/n: ' RESP
if [ $RESP == 'n' ]
then
    echo "Bye!"
    exit 1
else
    echo 'moving on'
fi

#Putting the full line of the groups we are editing into a file
grep sudo /etc/group > sudoers.txt
grep admin /etc/group > admins.txt

#Making strings of just groupname:x:linenumber
sudoGroup=$(awk -F: 'BEGIN{OFS=":";} {print $1,$2,$3;}' sudoers.txt)
adminGroup=$(awk -F: 'BEGIN{OFS=":";} {print $1,$2,$3;}' admins.txt)

#echo ${sudoGroup}
#echo ${adminGroup}

#Making an array of the opperators of our script (./admins.sh lkotlus rkotlus skotlus)
arguments=("$@")

for i in ${arguments[@]}
do
    id ${i} > uid.txt
done

if grep -q 'no such user' uid.txt
then
    cat uid.txt
    exit 1
fi

for i in ${arguments[@]}
do 
    if [ ${i} == ${arguments[0]} ]
    then
    sudoGroup="${sudoGroup}:${i},"
    elif [ ${i} == ${arguments[-1]} ]
    then
    sudoGroup="${sudoGroup}${i}"
    else
    sudoGroup="${sudoGroup}${i},"
    fi
done

echo ${sudoGroup}
