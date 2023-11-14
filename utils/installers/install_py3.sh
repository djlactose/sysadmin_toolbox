#!/bin/bash
echo $0 >> /mnt/installed.txt

apk add --no-cache py3-pip

if [ ! -f /mnt/python/name ]; then
    echo "Creating Python directory..."
    mkdir /mnt/python
    echo "Python Scripts" > /mnt/python/name
    cp /mnt/skel/run.sh /mnt/python/run.sh
fi