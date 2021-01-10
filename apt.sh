#!/bin/bash

# Updating
apt-get update -y
echo

# Showing the current package list, and notifying them of what there is and how to update it.
grep -r --include '*.list' '^deb ' /etc/apt/sources.list /etc/apt/sources.list.d/ > sources.txt
sed -i 's/^.*\(http:.*\).*$/\1/' sources.txt
awk -F' ' '{ print $1}' sources.txt
echo
awk -F' ' '{ print $1}' sources.txt > sourcelist.txt
echo "These are the packages currently being updated through apt. If you want to look at them again, look at the sourcelist.txt file. Re-add them through the updates settings."
echo

# Overwriting the current /etc/apt with our pre-configured /etc/apt (located on the github)
rsync -a --delete preConfigApt/ /etc/apt/ > /dev/null

# Upgrading and updating
apt-get update -y
apt-get upgrade -y
