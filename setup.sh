#!/bin/bash

#
## downloading the scripts
#

sudo wget https://raw.githubusercontent.com/hufflegamer123/GodModeButForLinux/master/EXTERMINATE.sh
sudo wget https://raw.githubusercontent.com/hufflegamer123/GodModeButForLinux/master/deleteFiles.sh
sudo wget https://raw.githubusercontent.com/hufflegamer123/GodModeButForLinux/master/passReq.sh
sudo wget https://raw.githubusercontent.com/hufflegamer123/GodModeButForLinux/master/admin.sh
sudo wget https://raw.githubusercontent.com/hufflegamer123/GodModeButForLinux/master/services.sh
sudo wget https://raw.githubusercontent.com/hufflegamer123/GodModeButForLinux/master/packages.sh
sudo wget https://raw.githubusercontent.com/hufflegamer123/GodModeButForLinux/master/passwords.sh
sudo wget https://raw.githubusercontent.com/hufflegamer123/GodModeButForLinux/master/apt.sh

#
## downloading the whitelists/blacklists
#

sudo wget https://raw.githubusercontent.com/hufflegamer123/GodModeButForLinux/master/servicesWhitelist.txt
sudo wget https://raw.githubusercontent.com/hufflegamer123/GodModeButForLinux/master/packageBlacklist.txt

#
## downloading the readmes
#

sudo wget https://raw.githubusercontent.com/hufflegamer123/GodModeButForLinux/master/EXTERMINATEreadme.md
sudo wget https://raw.githubusercontent.com/hufflegamer123/GodModeButForLinux/master/deleteFilesreadme.md
sudo wget https://raw.githubusercontent.com/hufflegamer123/GodModeButForLinux/master/passReqreadme.md
sudo wget https://raw.githubusercontent.com/hufflegamer123/GodModeButForLinux/master/adminreadme.md
sudo wget https://raw.githubusercontent.com/hufflegamer123/GodModeButForLinux/master/servicesreadme.md
sudo wget https://raw.githubusercontent.com/hufflegamer123/GodModeButForLinux/master/packagesreadme.md
sudo wget https://raw.githubusercontent.com/hufflegamer123/GodModeButForLinux/master/passwordsreadme.md
sudo wget https://raw.githubusercontent.com/hufflegamer123/GodModeButForLinux/master/aptreadme.md

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
