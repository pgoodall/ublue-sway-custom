#!/usr/bin/env bash

# Tell this script to exit if there are any errors.
# You should have this in every custom script, to ensure that your completed
# builds actually ran successfully without any errors!
set -oue pipefail

# Your code goes here.
groupadd -r greetd
useradd -r -g greetd -d /var/lib/greetd -s /sbin/nologin -c "greetd daemon user" greetd
chown -R greetd:greetd /etc/greetd/
usermod -aG video greetd
