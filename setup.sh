#!/bin/bash

#
## giving executable permissions to the scripts
#

sudo chmod +x EXTERMINATE.sh
sudo chmod +x deleteFiles.sh
sudo chmod +x passReq.sh
sudo chmod +x admin.sh
sudo chmod +x services.sh
sudo chmod +x packages.sh
sudo chmod +x passwords.sh
sudo chmod +x apt.sh
sudo chmod +x missingUsers.sh

#
## making the necessary files to pass around information, read information from, and write information to.
#

sudo touch adminWhitelist.txt
sudo touch sudoers.txt
sudo touch admins.txt
sudo touch isUser.txt
sudo touch users.txt
sudo touch users2.txt
sudo touch goodUsers.txt
sudo touch goodUsers2.txt
sudo touch badUsers.txt
sudo touch foundFiles.txt
sudo touch services.txt
sudo touch services2.txt
sudo touch servicesWhitelist2.txt
sudo touch badServices.txt
sudo touch sourcelist.txt
sudo touch sources.txt
sudo touch missingUsers.txt

#
## making a fancy littl ascii art
#

echo "
        _____           _  ___  ___          _               
       |  __ \         | | |  \/  |         | |              
       | |  \/ ___   __| | | .  . | ___   __| | ___          
       | | __ / _ \ / _| | | |\/| |/ _ \ / _| |/ _ \         
       | |_\ | (_) | (_| | | |  | | (_) | (_| |  __/         
        \____/\___/ \__,_| \_|  |_/\___/ \__,_|\___|         
                                                             
                                                             
  __ __          __      __            __                    __  
 / / | |         | |    / _|           | (_)                 \ \ 
| |  | |__  _   _| |_  | |_ ___  _ __  | |_ _ __  _   ___  _  | |
| |  | |_ \| | | | __| |  _/ _ \| '__| | | | '_ \| | | \ \/ / | |
| |  | |_) | |_| | |_  | || (_) | |    | | | | | | |_| |>  <  | |
| |  |_.__/ \__,_|\__| |_| \___/|_|    |_|_|_| |_|\__,_/_/\_\ | |
 \_\                                                         /_/ 
                                                             "
