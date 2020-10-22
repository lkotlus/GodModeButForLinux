#!/bin/bash

echo '!@!@!@!@!@!@!@!@!@!@!@!@!@!@!@!@!@!@!@!@!@!'
echo '           pay attention!!!'
echo '        Did you come back after'
echo '     editing the badServices file?'
echo '                (y/n)'
echo '!@!@!@!@!@!@!@!@!@!@!@!@!@!@!@!@!@!@!@!@!@!'

read -p 'y/n: ' RESP
if [ $RESP == 'y' ]
then
    IFS=$'\n' read -d '' -r -a badServices < badServices.txt

    for i in ${badServices[@]}
    do
        systemctl disable ${i}
        echo "Disabled ${i}"
        echo
    done
    
    exit 1
else
    echo "Okay"
fi

service --status-all > services.txt

servicesWhitelist=`awk -F] '{print $2}' servicesWhitelist.txt`
services=`awk -F] '{print $2}' services.txt`

echo "${servicesWhitelist//[[:blank:]]/}" > servicesWhitelist.txt
echo "${services//[[:blank:]]/}" > services.txt

sort services.txt > services2.txt
cat services2.txt > services.txt

sort servicesWhitelist.txt > servicesWhitelist2.txt
cat servicesWhitelist2.txt > servicesWhitelist.txt

comm -2 -3 services.txt servicesWhitelist.txt > badServices.txt

echo '!@!@!@!@!@!@!@!@!@!@!@!@!@!@!@!@!@!@!@!@!@!'
echo '           pay attention!!!'
cat badServices.txt
echo '   Do you want to delete these services?'
echo '                (y/n)'
echo '!@!@!@!@!@!@!@!@!@!@!@!@!@!@!@!@!@!@!@!@!@!'

read -p 'y/n: ' RESP
if [ $RESP == 'y' ]
then
    echo
    echo "Then let's do this"
    echo
else
    echo
    echo "Then edit the badServices file."
    exit 1
fi

echo 'it worked'

IFS=$'\n' read -d '' -r -a badServices < badServices.txt

for i in ${badServices[@]}
do 
    systemctl disable ${i}
    echo "Disabled ${i}"
done

echo '!@!@!@!@!@!@!@!@!@!@!@!@!@!@!@!@!@!@!@!@!@!'
echo '           pay attention!!!'
echo '   Do you want to reverse this action?'
echo '                (y/n)'
echo '!@!@!@!@!@!@!@!@!@!@!@!@!@!@!@!@!@!@!@!@!@!'

read -p 'y/n: ' RESP
if [ $RESP == 'y' ]
then
    for i in ${badServices[@]}
    do
        systemctl enable ${i}
        echo "Reenabled ${i}"
        echo
    done
else
    echo "I'm glad to see at least someone is responsible..."
    echo
fi
