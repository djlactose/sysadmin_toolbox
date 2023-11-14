#!/bin/bash
path=$( dirname "${BASH_SOURCE[0]}" )

echo "Marking all utils as executable..."
find $path/*.sh -exec chmod -v +x {} \;
if [ -f /mnt/installed.txt ]; then
    chmod -v 744 /mnt/installed.txt
fi