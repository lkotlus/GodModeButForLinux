#!/bin/bash

#
## giving executable permissions to the scripts
#

chmod +x EXTERMINATE.sh
chmod +x deleteFiles.sh
chmod +x passReq.sh
chmod +x admin.sh
chmod +x services.sh
chmod +x packages.sh
chmod +x passwords.sh
chmod +x apt.sh
chmod +x missingUsers.sh
chmod +x cron.sh
#
## making the necessary files and directories to pass around information, read information from, and write information to.
#

touch adminWhitelist.txt
touch sudoers.txt
touch admins.txt
touch isUser.txt
touch users.txt
touch users2.txt
touch goodUsers.txt
touch goodUsers2.txt
touch badUsers.txt
touch foundFiles.txt
touch services.txt
touch services2.txt
touch servicesWhitelist2.txt
touch badServices.txt
touch sourcelist.txt
touch sources.txt
touch missingUsers.txt
touch uid.txt
touch uid2.txt
touch crontabs.txt
touch cronjobs.txt
mkdir rawCronJobs

#
## installing necessary tools
#

apt-get install net-tools -y > /dev/null

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
