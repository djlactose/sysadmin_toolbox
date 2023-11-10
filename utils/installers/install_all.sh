#!/bin/bash
. $(dirname $0)/../utils.conf

for f in $(ls $path/*.sh |grep -v install_all.sh |grep -v run.sh); do
    bash "$f"
done