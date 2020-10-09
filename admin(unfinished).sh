#!/bin/bash

#We actually about to do the admins!

echo '*_____________________________________*'
echo '     have you come back after          ' 
echo '   editing the badUsers file? (y/n)    '
echo '*_____________________________________*'

read -p 'y/n: ' RESP
if [ $RESP == 'y' ]
then
    #do stuff here
    echo "Then let's do this thang"
    exit 1
else
    echo 'moving on'
fi

# sudo grep -n 'sudo' /etc/group > sudoers3.txt
# sudo grep -n 'admin' /etc/group > sudoers2.txt

sudo sed -i 's/.*://g' sudoers2.txt
sudo sed -i 's/PASS_MIN_DAYS.*/PASS_MIN_DAYS	7/g' sudoers3.txt

comm -1 -2 sudoers3.txt sudoers2.txt > sudoers.txt
comm -2 -3 sudoers3.txt sudoers2.txt >> sudoers.txt
comm -1 -3 sudoers3.txt sudoers2.txt >> sudoers.txt

cat sudoers.txt
