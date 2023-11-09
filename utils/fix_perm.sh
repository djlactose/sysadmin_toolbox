#!/bin/bash
. $(dirname $0)/utils.conf

echo "Marking all utils as executable..."
chmod -v +x $path/*.sh