#!/bin/bash
path=$( dirname "${BASH_SOURCE[0]}" )
choices=()
for i in `find -L $path/ -mindepth 2 -maxdepth 2 -name name`; do 
    tmp=($(echo $i |tr '/' "\n"))
    if [ "${tmp[0]}" = "." ]; then
        field=3
    else
        field=4
    fi
    choices+=("$(echo $i | cut -d "/" -f $field)" "$(cat $i)")
done
exitstatus=0
while [ $exitstatus -eq 0 ]; do
    OPTION=$(dialog --clear --title "$(cat $path/name)" --menu "Select which script to run:" 15 100 5 "${choices[@]}" 2>&1 > /dev/tty)
    exitstatus=$?
    if [ $exitstatus = 0 ]; then
        clear
        bash $path/$OPTION/run.sh
    else
        exitstatus=1
        clear
    fi
done