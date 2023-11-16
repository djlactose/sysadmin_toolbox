#!/bin/bash

read -p "Username: "
adduser -s /mnt/start.sh -G wheel $REPLY
chage -d 0 $REPLY
\cp -P /etc/passwd /root/bak/
\cp -P /etc/shadow /root/bak/
\cp -P /etc/group /root/bak/