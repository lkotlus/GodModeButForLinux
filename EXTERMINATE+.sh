#!/bin/bash

#getting rid of empty lines
sed -i '/^$/d' users.txt
sed -i '/^$/d' users2.txt

#Looping through 50 possible uids for users. This will work most of the time. Take care when looking at the badUsers file.
for i in {1000..1050}
do 
    sudo grep -n $i /etc/passwd >> users.txt
done

sed -i '/^$/d' users.txt
sed -i '/^$/d' users2.txt

awk -F: '{ print $2}' users.txt > users2.txt
cat users2.txt > users.txt

sed -i '/^$/d' users.txt
sed -i '/^$/d' users2.txt

#Comparing users.txt to goodUsers.txt
comm -2 -3 users.txt goodUsers.txt > badUsers.txt
#Making a badUsers array out of badUsers.txt
IFS=$'\n' read -d '' -r -a badUsers < badUsers.txt

echo $badUsers
