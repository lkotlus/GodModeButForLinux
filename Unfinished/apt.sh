#!/bin/bash

# Adding automatic updates
echo -e 'APT::Periodic::Update-Package-Lists "1";\nAPT::Periodic::Unattended-Upgrade "1";' | sudo tee /etc/apt/apt.conf.d/20auto-upgrades > /dev/null

# Only adding the recommended repos (this is a tad more complicated)
grep -r --include '*.list' '^deb ' /etc/apt/sources.list /etc/apt/sources.list.d/ > sources.txt
sed -i 's/^.*\(http:.*\).*$/\1/' sources.txt
awk -F' ' '{ print $1}' sources.txt
