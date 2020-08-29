#!/bin/bash

#It is time to EXTERMINATE

#polishing our CLI a little bit.

echo '*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*'
cat badUsers.txt
echo '*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*'

#checking that our user wants to proceed.

echo 'are these the users you would like to EXTERMINATE?'
read -p 'y/n: ' RESP
if [ $RESP == 'y' ]
then
        echo
        echo "then let's get to EXTERMINATING"
else
        echo 'then eddit the badUsers.txt file.'
        exit 1
fi

#creating an array (list if you are a python plebian) from our txt file.

IFS=$'\n' read -d '' -r -a lines < /home/kali/badUsers.txt

#looping through our array.

for i in ${lines[@]}
do
        echo EXTERMINATING user: $i
        sudo deluser --quiet $i
done
