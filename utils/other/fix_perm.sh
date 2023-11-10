#!/bin/bash
. $(dirname $0)/../utils.conf

echo "Marking all utils as executable..."
find $path/../*/*.sh -exec chmod -v +x {} \;