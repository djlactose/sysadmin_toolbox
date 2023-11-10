#!/bin/bash
path=$( dirname "${BASH_SOURCE[0]}" )

choices=()
for i in `find -L $path/ -mindepth 2 -maxdepth 2 -name name`; do 
    choices+=("$(echo $i | cut -d "/" -f 4)" "$(cat $i)")
done
echo ${choices[@]}
exitstatus=0
while [ $exitstatus -eq 0 ]; do
    OPTION=$(dialog --clear --title "Toolbox Utilities" --menu "Select which script to run:" 15 100 5 "${choices[@]}" 2>&1 > /dev/tty)
    exitstatus=$?
    if [ $exitstatus = 0 ]; then
        clear
        $path/$OPTION/run.sh
    else
        exitstatus=1
        clear
    fi
done