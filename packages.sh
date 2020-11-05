#!/bin/bash

#
## This is a script that will go through a blacklist of packages, check if any are present, and then delete those that are on the machine.
#

echo "Are you ready to remove some bad packages? (y/n)"

read -p 'y/n: ' RESP
if [ $RESP == 'y' ]
then
    echo "Then let's get going!"
else
    echo "Bye!"
    exit 1
fi

# Making the array packageBlacklist from the packageBlacklist.txt file. Every new line from the file will be an ellement in the array.
IFS=$'\n' read -d '' -r -a packageBlacklist < packageBlacklist.txt
# Making an empty array that will hold all of the packages from the blacklist that are on the machine. We use declare -a because it needs to be empty.
declare -a badPackages

for i in ${packageBlacklist[@]}
do
    dpkg -s ${i} &> /dev/null
    if [ $? == 0 ]
    then
        badPackages+=(${i})
        echo "The package ${i} has been found!"
    fi
done

#echo "${packageBlacklist[83]}"
#echo "${badPackages[@]}"

# Looping through and removing the packages.

for i in ${badPackages[@]}
do
    sudo apt-get remove ${i} -y &> /dev/null
    if [ $? == 0 ]
    then
        echo "Removed package ${i}!"
    else
        echo "[URGENT MESSAGE]: Something went wrong while trying to remove the package ${i}."
    fi
done
