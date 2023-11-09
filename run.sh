#!/bin/bash

if [ -f /mnt/installed.txt ]; then
    cat /mnt/installed.txt | bash
fi
sleep infinity