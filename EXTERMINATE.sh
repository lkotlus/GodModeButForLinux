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
        echo 'then edit the badUsers.txt file.'
        exit 1
fi

#creating an array (list if you are a python plebian) from our txt file.

IFS=$'\n' read -d '' -r -a lines < /home/lkotlus/badUsers.txt

#looping through our array.

for i in ${lines[@]}
do
        echo EXTERMINATING user: $i
        sudo deluser --quiet $i
done

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
        sudo cp /etc/ssh/sshd_config /etc/ssh/sshd_config.bac

        #Turning root off

        echo 'EXTERMINATING root'
        sudo sed -i 's/PermitRootLogin.*/PermitRootLogin no/g' /etc/ssh/sshd_config
	sudo sed -i 's/#PermitRootLogin.*/PermitRootLogin no/g' /etc/ssh/sshd_config
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
	sudo sed -i 's/# allow-guest.*/allow-guest=false/g' /etc/lightdm/lightdm.conf
	sudo sed -i 's/allow-guest.*/allow-guest=false/g' /etc/lightdm/lightdm.conf
else
	echo '*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-**-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-'
        echo 'Check the /etc/lightdm/lighdm.conf for allow-guest, it appears to be missing.'
        echo '*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-**-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-'
fi
