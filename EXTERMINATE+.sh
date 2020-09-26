#!/bin/bash

for i in {1000..1050}
do 
    sudo grep -n $i /etc/passwd >> users.txt
done

awk -F: '{ print $2}' /home/kali/users.txt > users2.txt
cat users2.txt > users.txt
