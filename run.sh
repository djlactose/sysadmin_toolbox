#!/bin/bash

if [ -f /mnt/installed.txt ]; then
    cat /mnt/installed.txt | bash
fi
if [ -f /root/.bk/passwd ]; then
    \cp -P /root/bak/ /etc/passwd
    \cp -P /root/bak/ /etc/shadow
    \cp -P /root/bak/ /etc/gshadow
    \cp -P /root/bak/ /etc/group
fi
sleep infinity