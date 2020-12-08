#!/bin/bash

echo 'Would you like to check for missing users (keep in mind that you should either run the root.sh script or manually check for uid 0 users first.)?'

read -p 'y/n: ' RESP
if [ $RESP == 'y' ]
then
        echo
        echo "Then let's keep on keeping on"
else
        echo 
        echo 'Bye'
        exit 1
fi

#Getting rid of empty lines
sed -i '/^$/d' users.txt
sed -i '/^$/d' users2.txt

#Looping through 50 possible uids for users. This will work most of the time. Take care when looking at the badUsers file.
for i in {1000..2000}
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
sort users.txt > users2.txt
sort goodUsers.txt > goodUsers2.txt
cat users2.txt > users.txt
cat goodUsers2.txt > goodUsers.txt
comm -2 -3 users.txt goodUsers.txt > badUsers.txt

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

#Comparing users.txt to goodUsers.txt and sorting both files (sorting the files is required to use comm)
sudo sort users.txt > users2.txt
sudo sort goodUsers.txt > goodUsers2.txt

cat users2.txt > users.txt
cat goodUsers2.txt > goodUsers.txt

sudo comm -1 -3 --nocheck-order users.txt goodUsers.txt > missingUsers.txt
echo 

#Making a badUsers array out of badUsers.txt
IFS=$'\n' read -d '' -r -a missingUsers < missingUsers.txt

echo '*_____________________________________*'
echo ' Do these look like the missing users? ' 
cat missingUsers.txt
echo '*_____________________________________*'

read -p 'y/n: ' RESP
if [ $RESP == 'y' ]
then
        echo
        echo "then let's add them"
        echo
else
        echo 
        echo 'Then DIY.'
        exit 1
fi

for i in ${missingUsers[@]}
do
    echo "adding the user $i"
    sudo useradd $i > /dev/null
    echo
done

echo 'Done (:'