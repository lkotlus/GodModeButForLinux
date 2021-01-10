#!/bin/bash

#Checking if the user is coming back after editing the badUsers.txt file
echo '*_____________________________________*'
echo '     have you come back after          ' 
echo '   editing the badUsers file? (y/n)    '
echo '*_____________________________________*'

read -p 'y/n: ' RESP
if [ $RESP == 'y' ]
then
    echo
    echo "Then let's get to EXTERMINATING"

    sort users.txt > users2.txt
    sort goodUsers.txt > goodUsers2.txt

    cat users2.txt > users.txt
    cat goodUsers2.txt > goodUsers.txt

    comm -2 -3 --nocheck-order users.txt goodUsers.txt > badUsers.txt
    echo

    IFS=$'\n' read -d '' -r -a badUsers < badUsers.txt

    for i in ${badUsers[@]}
    do
        echo EXTERMINATING user: $i
        deluser --quiet $i
    done
    
    echo
    echo 'Would you like to EXTERMINATE the root user?'
    read -p 'y/n: ' RESP
    if [ $RESP == 'y' ]
    then
            echo
            echo "then let's get to EXTERMINATING (again)"
    else
            echo 'Smell ya later'
            exit 1
    fi

    if grep -q PermitRootLogin /etc/ssh/sshd_config
    then
            #Saving a copy of the file we are edditing
            echo 'Saving a copy of your /etc/ssh/sshd_config file'
            cp /etc/ssh/sshd_config /etc/ssh/sshd_config.bac

            #Turning root off

            echo 'EXTERMINATING root'
            sed -i 's/PermitRootLogin.*/PermitRootLogin no/g' /etc/ssh/sshd_config
            sed -i 's/#PermitRootLogin.*/PermitRootLogin no/g' /etc/ssh/sshd_config
    else

        #Giving an error message.

            echo '*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-**-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-'
            echo 'Check the /etc/ssh/sshd_config for PermitRootLogin, it appears to be missing.'
            echo '*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-**-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-'
    fi

    echo 'Would you like to EXTERMINATE the guest user?'
    read -p 'y/n: ' RESP
    if [ $RESP == 'y' ]
    then
            echo
            echo "then let's get to EXTERMINATING (again)"
    else
            echo 'Smell ya later'
            exit 1
    fi

    if grep -q '# allow-guest' /etc/lightdm/lightdm.conf
    then
        echo 'EXTERMINATING guest'
        sed -i 's/# allow-guest.*/allow-guest=false/g' /etc/lightdm/lightdm.conf
        sed -i 's/allow-guest.*/allow-guest=false/g' /etc/lightdm/lightdm.conf
    else
        echo '*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-**-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-'
            echo 'Check the /etc/lightdm/lighdm.conf for allow-guest, it appears to be missing.'
            echo '*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-**-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-'
    fi
    exit 1
else
        echo 
        echo 'Okay'
fi

#
#
#
#
#
#
#
#
#
######
###   THIS IS WHERE THE REGULAR RUN OF THE SCRIPT BEGINS
######
#
#
#
#
#
#
#
#
#

#Getting rid of empty lines
sed -i '/^$/d' users.txt
sed -i '/^$/d' users2.txt

#Looping through 50 possible uids for users. This will work most of the time. Take care when looking at the badUsers file.
for i in {1000..2000}
do 
    grep -n $i /etc/passwd >> users.txt
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
    grep -n $i /etc/passwd >> users.txt
done

sed -i '/^$/d' users.txt
sed -i '/^$/d' users2.txt

awk -F: '{ print $2}' users.txt > users2.txt
cat users2.txt > users.txt

sed -i '/^$/d' users.txt
sed -i '/^$/d' users2.txt

#Comparing users.txt to goodUsers.txt and sorting both files (sorting the files is required to use comm)
sort users.txt > users2.txt
sort goodUsers.txt > goodUsers2.txt

cat users2.txt > users.txt
cat goodUsers2.txt > goodUsers.txt

comm -2 -3 --nocheck-order users.txt goodUsers.txt > badUsers.txt
echo 

#Making a badUsers array out of badUsers.txt
IFS=$'\n' read -d '' -r -a badUsers < badUsers.txt

#Printing out the full badUsers array and asking if they are the users you would like to remove
echo '*_____________________________________*'
echo '  are these the users you would        ' 
echo '    like to EXTERMINATE? (y/n)         '
cat badUsers.txt
echo '*_____________________________________*'

read -p 'y/n: ' RESP
if [ $RESP == 'y' ]
then
        echo
        echo "then let's get to EXTERMINATING"
else
        echo 
        echo 'Then edit the badUsers.txt file.'
        exit 1
fi

for i in ${badUsers[@]}
do
        echo EXTERMINATING user: $i
        deluser --quiet $i
done

echo
echo 'Would you like to EXTERMINATE the root user?'
read -p 'y/n: ' RESP
if [ $RESP == 'y' ]
then
        echo
        echo "then let's get to EXTERMINATING (again)"
else
        echo 'Okay'
fi

if grep -q PermitRootLogin /etc/ssh/sshd_config
then
        #Saving a copy of the file we are edditing
        echo 'Saving a copy of your /etc/ssh/sshd_config file'
        cp /etc/ssh/sshd_config /etc/ssh/sshd_config.bac

        #Turning root off

        echo 'EXTERMINATING root'
        sed -i 's/PermitRootLogin.*/PermitRootLogin no/g' /etc/ssh/sshd_config
	sed -i 's/#PermitRootLogin.*/PermitRootLogin no/g' /etc/ssh/sshd_config
else

	#Giving an error message.

        echo '*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-**-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-'
        echo 'Check the /etc/ssh/sshd_config for PermitRootLogin, it appears to be missing.'
        echo '*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-**-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-'
fi

echo 'Would you like to EXTERMINATE the guest user?'
read -p 'y/n: ' RESP
if [ $RESP == 'y' ]
then
        echo
        echo "then let's get to EXTERMINATING (again)"
else
        echo 'Smell ya later'
        exit 1
fi

if grep -q '# allow-guest' /etc/lightdm/lightdm.conf
then
	echo 'EXTERMINATING guest'
	sed -i 's/# allow-guest.*/allow-guest=false/g' /etc/lightdm/lightdm.conf
	sed -i 's/allow-guest.*/allow-guest=false/g' /etc/lightdm/lightdm.conf
else
	echo '*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-**-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-'
        echo 'Check the /etc/lightdm/lighdm.conf for allow-guest, it appears to be missing.'
        echo '*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-**-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-'
fi
