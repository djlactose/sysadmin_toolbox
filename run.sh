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
    /mnt/utils/other/cleanup_installed.sh
    cp /mnt/installed.txt /tmp/installed.txt
    cat /tmp/installed.txt | bash
    rm /tmp/installed.txt
else
    touch /root/bak/installed.txt
    chmod 666 /root/bak/installed.txt
    ln -s /root/bak/installed.txt /mnt/installed.txt
fi
if [ ! -d /mnt/utils ]; then
    ln -s /opt/sysadmin_toolbox/utils /mnt/utils
fi
if [ ! -d /mnt/skel ]; then
    ln -s /opt/sysadmin_toolbox/skel /mnt/skel
fi
if [ ! -d /mnt/templates ]; then
    ln -s /opt/sysadmin_toolbox/templates /mnt/templates
fi
if [ ! -f /mnt/start.sh ]; then
    ln -s /opt/sysadmin_toolbox/start.sh /mnt/start.sh
fi

/usr/sbin/sshd -f /etc/ssh/sshd_config -D -e