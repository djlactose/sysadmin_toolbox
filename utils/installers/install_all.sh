#!/bin/bash
. $( dirname "${BASH_SOURCE[0]}" )/../utils.conf
path=$( dirname "${BASH_SOURCE[0]}" )

for f in $(ls $path/*.sh |grep -v install_all.sh |grep -v run.sh); do
    bash "$f"
done