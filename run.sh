#!/bin/bash

if [ -f /root/bak/passwd ]; then
    \cp -P /root/bak/passwd /etc/
    \cp -P /root/bak/shadow /etc/
    \cp -P /root/bak/group /etc/
fi
if [ -f /root/bak/ssh_host_rsa_key ]; then
    cp /root/bak/ssh_host_rsa_key /etc/ssh/
    cp /root/bak/ssh_host_dsa_key /etc/ssh/
    cp /root/bak/ssh_host_ecdsa_key /etc/ssh/
    cp /root/bak/ssh_host_ed25519_key /etc/ssh/
else
    ssh-keygen -f /etc/ssh/ssh_host_rsa_key -N '' -t rsa && \
    ssh-keygen -f /etc/ssh/ssh_host_dsa_key -N '' -t dsa && \
    ssh-keygen -f /etc/ssh/ssh_host_ecdsa_key -N '' -t ecdsa && \
    ssh-keygen -f /etc/ssh/ssh_host_ed25519_key -N '' -t ed25519
    cp /etc/ssh/ssh_host_rsa_key /root/bak/
    cp /etc/ssh/ssh_host_dsa_key /root/bak/
    cp /etc/ssh/ssh_host_ecdsa_key /root/bak/
    cp /etc/ssh/ssh_host_ed25519_key /root/bak/
fi
if [ -f /mnt/installed.txt ]; then
    cp /mnt/installed.txt /tmp/installed.txt
    cat /tmp/installed.txt | bash
    rm /tmp/installed.txt
fi
/usr/sbin/sshd -f /etc/ssh/sshd_config -D -e