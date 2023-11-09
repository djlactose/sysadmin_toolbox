#!/bin/bash
. $(dirname $0)/utils.conf

bash "$path/fix_perm.sh"
for f in $(ls $path/*.sh |grep -v install_all.sh |grep -v fix_perm.sh|grep -v run.sh); do
    bash "$f"
done