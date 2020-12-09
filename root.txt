#!/bin/bash

echo "Would you like to disable/relocate uid 0 users? (y/n)"
echo

read -p 'y/n: ' RESP
if [ $RESP == 'y' ]
then
    echo 'nice!'
    echo
else
    echo 'bye!'
    exit 1
fi

echo "Would you like to disable the root user (change /bin/bash to /bin/false)"

read -p 'y/n: ' RESP
if [ $RESP == 'y' ]
then
    echo 'coolio'
    echo
    sudo sed -i 's#root:x:0:.*#root:x:0:0:root:/root:/bin/false#g' /etc/passwd
    echo 'done!'
    echo
else
    echo 'okay'
fi

echo "Would you like to remove the root group?"

if [ $RESP == 'y' ]
then
    echo 'bepic'
    echo
    sudo groupdel root
    echo 'done!'
    echo
else
    echo 'k'
fi

echo "Would you like to check for uid 0 users and deal with them accourdingly?"

read -p 'y/n: ' RESP
if [ $RESP == 'y' ]
then
    echo 'bepic!'
    echo

    grep :x:0: /etc/passwd > uid.txt
    awk -F: '{ print $1}' uid.txt > uid2.txt
    cat uid2.txt > uid.txt
    sudo sed -i '/root/d' uid.txt
    IFS=$'\n' read -d '' -r -a rootScum < uid.txt
    newUid=1050

    for i in ${rootScum[@]}
    do
        echo "Changing the uid of ${i}"
        sudo sed -i "s#${i}.*#${i}:x:${newUid}:${newUid}:/home/${i}:/bin/bash#g" /etc/passwd
        newUid=$((newUid+1))
    done
    echo
else
    echo 'okay'
    echo
fi

echo "that's all folks!"
