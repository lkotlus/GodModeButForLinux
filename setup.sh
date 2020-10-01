echo 'Would you like to set up EXTERMINATE, deleteFiles, and passReq? (y/n)'
read -p 'y/n: ' RESP
if [ $RESP == 'y' ]
then
    sudo wget https://raw.githubusercontent.com/hufflegamer123/GodModeButForLinux/master/EXTERMINATE.sh
    sudo wget https://raw.githubusercontent.com/hufflegamer123/GodModeButForLinux/master/deleteFiles.sh
    sudo wget https://raw.githubusercontent.com/hufflegamer123/GodModeButForLinux/master/passReq.sh
    sudo touch users.txt
    sudo touch users2.txt
    sudo touch goodUsers.txt
    sudo touch goodUsers2.txt
    sudo touch badUsers.txt
    sudo chmod +x EXTERMINATE.sh
    echo 'Make sure you add a whitelist to goodUsers.txt'
    sudo touch foundFiles.txt
    sudo chmod +x deleteFiles.sh
    sudo chmod +x passReq.sh
else
    echo 'Okay!'
    exit 1
fi
