#!/bin/bash
. $(dirname $0)/../utils.conf

#######################################################################
########################## List Utilites ##############################
choices=("add_user.sh" "Add new user")
choices+=("fix_perm.sh" "Fix execute permissions on all utilities")
#######################################################################
#######################################################################
exitstatus=0
while [ $exitstatus -eq 0 ]; do
    OPTION=$(dialog --clear --title "Other Utilities" --menu "Select which script to run:" 15 100 5 "${choices[@]}" 2>&1 > /dev/tty)
    exitstatus=$?
    if [ $exitstatus -eq 0 ]; then
        clear
        sudo $path/$OPTION 2>&1 > /dev/tty
        echo ""
        echo "Installed Packages:"
        sort /mnt/installed.txt | uniq | tee /mnt/installed.txt
        echo "" 2>&1 > /dev/tty
        echo "Press any key to continue..." 2>&1 > /dev/tty
        read
    else
        exitstatus=1
    fi
done