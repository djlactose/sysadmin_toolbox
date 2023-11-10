#!/bin/bash
. $( dirname "${BASH_SOURCE[0]}" )/../utils.conf
path=$( dirname "${BASH_SOURCE[0]}" )

echo "Marking all utils as executable..."
find $path/*/*.sh -exec chmod -v +x {} \;