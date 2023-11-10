#!/bin/bash
path=$( dirname "${BASH_SOURCE[0]}" )

echo "Marking all utils as executable..."
find $path/*.sh -exec chmod -v +x {} \;
chmod 