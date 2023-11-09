#!/bin/bash
choices=()
for i in `find -L /mnt/ -mindepth 2 -maxdepth 2 -name name`; do 
    choices+=("$(echo $i | cut -d "/" -f 3)" "$(cat $i)")
done
echo ${choices[@]}
exitstatus=0
while [ $exitstatus -eq 0 ]; do
    OPTION=$(dialog --clear --title "System Administrator Toolbox" --menu "Select which script to run:" 15 30 5 "${choices[@]}" 2>&1 > /dev/tty)
    exitstatus=$?
    if [ $exitstatus = 0 ]; then
        clear
        $(./$OPTION/run.sh)
    else
        exitstatus=1
        clear
    fi
done