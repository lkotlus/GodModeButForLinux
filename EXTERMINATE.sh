#!/bin/bash

#Let's set some password requirements!

#Polishing our CLI.

echo '*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*'
echo '|                               |'
echo '*                               *'
echo '|      Welcome to passReq!      |'
echo '*      Press y to continue      *'
echo '|      Press n to cancel        |'
echo '*                               *'
echo '*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*'
echo

#Checking that our user wants to proceed.

read -p 'y/n: ' RESP
if [ $RESP == 'y' ]
then
        echo
        echo "Then let's get to setting some password requirements!"
else
        echo 'See you later!'
        exit 1
fi

sed -i 's/PASS_MAX_DAYS 99999/PASS_MAX_DAYS     7/g' testfile.txt
