#!/bin/bash

echo "Are you ready to view the cron jobs? (y/n)"

read -p 'y/n: ' RESP
if [ $RESP == 'y' ]
then
    echo "Noice, smort"
else
    exit 1
fi

#listing out the crontab files
ls /var/spool/cron/crontabs/ > crontabs.txt

#making an array from the crontabs file
IFS=$'\n' read -d '' -r -a crontabs < crontabs.txt

#looping through the files
for i in ${crontabs[@]}
do
    if [[ ${i} == ${crontabs[0]} ]]
    then
        echo "${i}:" > cronjobs.txt
        cat /var/spool/cron/crontabs/${i} >> cronjobs.txt
    else
        echo "${i}:" >> cronjobs.txt
        cat /var/spool/cron/crontabs/${i} >> cronjobs.txt
    fi
done

sed -i '/# .*/d' cronjobs.txt

echo
echo "you can view all the cron jobs in the cronjobs.txt file."
