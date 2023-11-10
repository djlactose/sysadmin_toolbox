#!/bin/bash

read -p "Username: "
adduser -s /mnt/start.sh -G wheel $REPLY
\cp -P /etc/passwd /root/bak/
\cp -P /etc/shadow /root/bak/
\cp -P /etc/group /root/bak/