#!/bin/bash

#######################################################################
########################## List Utilites ##############################
choices=("add_user.sh" "Add new user")
choices+=("change_pass.sh" "Change your password")
choices+=("fix_perm.sh" "Fix execute permissions on all utilities")
choices+=("cleanup_installed.sh" "Automatically clean the installed app list")
#######################################################################
#######################################################################
exitstatus=0
while [ $exitstatus -eq 0 ]; do
    OPTION=$(dialog --clear --title "Other Utilities" --menu "Select which script to run:" 15 100 5 "${choices[@]}" 2>&1 > /dev/tty)
    exitstatus=$?
    if [ $exitstatus -eq 0 ]; then
        clear
        sudo bash $( dirname "${BASH_SOURCE[0]}" )/$OPTION 2>&1 > /dev/tty
        sudo bash $( dirname "${BASH_SOURCE[0]}" )/cleanup_installed.sh
        echo ""
        echo "Press any key to continue..." 2>&1 > /dev/tty
        read
    else
        exitstatus=1
    fi
done