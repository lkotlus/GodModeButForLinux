#!/bin/bash

#We actually about to do the admins!

#
#
##
##
###
#### THE FILE METHOD STARTS HERE!!!
###
##
##
#
#

if [ $1 == -f ]
then
    echo '*-*-*-*-*-*-*-*-*-*-*-*'
    echo 'Using the file setting!'
    echo '*-*-*-*-*-*-*-*-*-*-*-*'
    echo
    echo

    echo '*_____________________________________*'
    echo '      Would you like correct the       ' 
    echo '      sudo and admin group?(y/n)       '
    echo '*_____________________________________*'

    read -p 'y/n: ' RESP
    if [ $RESP == 'n' ]
    then
        echo
        echo 'Bye!'
        exit 1
    else
        echo 
        echo 'Moving on...'
        echo
    fi

    #Putting the full line of the groups we are editing into a file
    grep sudo /etc/group > sudoers.txt
    grep admin /etc/group > admins.txt
    
    #Making strings of just groupname:x:linenumber
    sudoGroup=$(awk -F: 'BEGIN{OFS=":";} {print $1,$2,$3;}' sudoers.txt)
    adminGroup=$(awk -F: 'BEGIN{OFS=":";} {print $1,$2,$3;}' admins.txt)

    echo ${sudoGroup}
    echo ${adminGroup}

    #Making an array of all our usernames from the adminWhitelist.txt
    IFS=$'\n' read -d '' -r -a arguments < adminWhitelist.txt

    for i in ${arguments[@]}
    do
        if [ ${i} == ${arguments[0]} ]
        then
            id ${i} &> isUser.txt
        else
            id ${i} &>> isUser.txt
        fi
    done

    if grep -q 'no such user' isUser.txt
    then
        echo '*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*'
        echo 
        grep 'no such user' isUser.txt
        echo
        echo 'Try fixing the usernames!'
        echo
        echo '*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*'
        exit 1
    fi

    for i in ${arguments[@]}
    do 
        if [[ ${i} == ${arguments[0]} && ${#arguments[@]} > 0 ]]
        then
            sudoGroup="${sudoGroup}:${i},"
            adminGroup="${adminGroup}:${i},"
        elif [[ ${i} == ${arguments[0]} && ${#arguments[@]} == 0 ]]
        then
            sudoGroup="${sudoGroup}:${i}"
            adminGroup="${adminGroup}:${i}"
        elif [ ${i} == ${arguments[-1]} ]
        then
            sudoGroup="${sudoGroup}${i}"
            adminGroup="${adminGroup}${i}"
        else
            sudoGroup="${sudoGroup}${i},"
            adminGroup="${adminGroup}${i},"
        fi
    done

    sudo sed -i "s/sudo.*/${sudoGroup}/g" /etc/group
    sudo sed -i "s/admin.*/${adminGroup}/g" /etc/group

    echo "New sudo group: ${sudoGroup}"
    echo "New admin group: ${adminGroup}"

    exit 1
fi

#
#
##
##
###
#### THE ARGUMENTS METHOD STARTS HERE!!!
###
##
##
#
#

echo '*_____________________________________*'
echo '      Would you like correct the       ' 
echo '      sudo and admin group?(y/n)       '
echo '*_____________________________________*'

read -p 'y/n: ' RESP
if [ $RESP == 'n' ]
then
    echo
    echo "Bye!"
    exit 1
else
    echo
    echo 'Moving on...'
    echo 
fi

#Putting the full line of the groups we are editing into a file
grep sudo /etc/group > sudoers.txt
grep admin /etc/group > admins.txt

#Making strings of just groupname:x:linenumber
sudoGroup=$(awk -F: 'BEGIN{OFS=":";} {print $1,$2,$3;}' sudoers.txt)
adminGroup=$(awk -F: 'BEGIN{OFS=":";} {print $1,$2,$3;}' admins.txt)

#echo ${sudoGroup}
#echo ${adminGroup}

#Making an array of the operators of our script (./admins.sh lkotlus rkotlus skotlus)
arguments=("$@")

for i in ${arguments[@]}
do
    if [ ${i} == ${arguments[0]} ]
    then
        id ${i} &> isUser.txt
    else
        id ${i} &>> isUser.txt
    fi
done

if grep -q 'no such user' isUser.txt
then
    echo '*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*'
    echo 
    grep 'no such user' isUser.txt
    echo
    echo 'Try fixing the usernames!'
    echo
    echo '*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*'
    exit 1
fi

for i in ${arguments[@]}
do 
    if [[ ${i} == ${arguments[0]} && $# > 1 ]]
    then
        sudoGroup="${sudoGroup}:${i},"
        adminGroup="${adminGroup}:${i},"
    elif [[ ${i} == ${arguments[0]} && $# == 1 ]]
    then
        sudoGroup="${sudoGroup}:${i}"
        adminGroup="${adminGroup}:${i}"
    elif [ ${i} == ${arguments[-1]} ]
    then
        sudoGroup="${sudoGroup}${i}"
        adminGroup="${adminGroup}${i}"
    else
        sudoGroup="${sudoGroup}${i},"
        adminGroup="${adminGroup}${i},"
    fi
done

sudo sed -i "s/sudo.*/${sudoGroup}/g" /etc/group
sudo sed -i "s/admin.*/${adminGroup}/g" /etc/group

echo "New sudo group: ${sudoGroup}"
echo "New admin group: ${adminGroup}"
