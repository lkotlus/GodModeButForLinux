#!/bin/bash

echo "It is recomended that you run the EXTERMINATE script before this, with this in mind, would you like to continue? (y/n)"

    read -p 'y/n: ' RESP
    if [ $RESP == 'y' ]
    then
        echo
        echo 'Nice'
        echo 
    else
        echo 
        echo 'Bye :('
        exit 1
    fi

# Updating the users.txt file

sed -i '/^$/d' users.txt
sed -i '/^$/d' users2.txt

for i in {1000..2000}
do 
    if [ ${i} == 1000 ]
    then
        sudo grep -n $i /etc/passwd > users.txt
    else
        sudo grep -n $i /etc/passwd >> users.txt
    fi
done

sed -i '/^$/d' users.txt
sed -i '/^$/d' users2.txt

awk -F: '{ print $2}' users.txt > users2.txt
cat users2.txt > users.txt

sed -i '/^$/d' users.txt
sed -i '/^$/d' users2.txt

IFS=$'\n' read -d '' -r -a users < users.txt

if [ $# == 1 ]   
then
    for i in ${users[@]}
    do
        echo -e "$1\n$1" | sudo passwd ${i} &> /dev/null
        if [ $? != 0 ]
        then
            echo -e "Something went wrong when trying to change the password for ${i}"
        else
            echo -e "Successfully changed the password for ${i}"
        fi
    done
elif [ $# == 0 ]
then
    echo "Not enough arguments!"
else 
    echo 'Too many arguments!'
fi
