#!/bin/bash
sudo wget https://raw.githubusercontent.com/hufflegamer123/GodModeButForLinux/master/EXTERMINATE.sh
sudo wget https://raw.githubusercontent.com/hufflegamer123/GodModeButForLinux/master/deleteFiles.sh
sudo wget https://raw.githubusercontent.com/hufflegamer123/GodModeButForLinux/master/passReq.sh
sudo wget https://raw.githubusercontent.com/hufflegamer123/GodModeButForLinux/master/admin.sh
sudo touch adminsWhitelist.txt
sudo touch sudoers.txt
sudo touch admins.txt
sudo touch isUser.txt
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
sudo chmod +x admin.sh
