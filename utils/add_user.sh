#!/bin/bash
user=read -p "Username: "
adduser -s /mnt/start.sh -G wheel $user
\cp -P /etc/passwd /root/bak/
\cp -P /etc/shadow /root/bak/
\cp -P /etc/gshadow /root/bak/
\cp -P /etc/group /root/bak/