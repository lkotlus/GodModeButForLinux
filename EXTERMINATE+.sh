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

#Making an array for authorized users and an array for users on the system.
IFS=$'\n' read -d '' -r -a users < users.txt
IFS=$'\n' read -d '' -r -a authUsers < goodUsers.txt

goodUsers=()
badUsers=()

for x in ${users[@]}
do 
    for y in ${authUsers[@]}
    do 
        if [[ $x == $y ]]
        then
            goodUsers+=$x
            echo $x
        elif [[ $x != $y ]]
        then 
            echo $x
        fi
    done
done

echo $goodUsers
echo $badUsers
