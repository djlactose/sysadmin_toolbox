#!/bin/bash
echo $0 >> /mnt/installed.txt

apk add --no-cache ansible
if [ ! -f /mnt/ansible/name ]; then
    echo "Creating Ansible directory..."
    mkdir /mnt/ansible
    echo "Ansible Scripts" > /mnt/ansible/name
    cp /mnt/skel/run.sh /mnt/ansible/run.sh
fi