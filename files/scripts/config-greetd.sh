#!/usr/bin/env bash

# Tell this script to exit if there are any errors.
# You should have this in every custom script, to ensure that your completed
# builds actually ran successfully without any errors!
set -oue pipefail

# Your code goes here.
echo "Checking for the group: _greetd"
if ![ id -g "_greetd" > /dev/null 2>&1 ]; then
    #groupadd -r greetd;
    echo "creating the group: greetd"
fi

echo "Checking for the user: _greetd"
if ![ id -u "_greetd" > /dev/null 2>&1 ]; then
    #useradd -r -g greetd -d /var/lib/greetd -s /sbin/nologin -c "greetd daemon user" greetd
    echo "creating the user: greetd"
fi

# If this fails I want the script to fail
chown -R greetd:greetd /etc/greetd/

# This will no fail even if the user is already in the video group
usermod -aG video greetd
