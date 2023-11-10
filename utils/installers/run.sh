#!/bin/bash

#######################################################################
########################## List Utilites ##############################
choices+=("install_all.sh" "Run all utilities")
choices+=("install_ansible.sh" "Install Ansible")
choices+=("install_git.sh" "Install Git")
choices+=("install_pwsh.sh" "Install Powershell")
choices+=("install_py3.sh" "Install Python3")
choices+=("install_py_mssql.sh" "Install Python3 libs for MSSQL")
#######################################################################
#######################################################################
exitstatus=0
while [ $exitstatus -eq 0 ]; do
    OPTION=$(dialog --clear --title "Installers" --menu "Select which script to run:" 15 100 5 "${choices[@]}" 2>&1 > /dev/tty)
    exitstatus=$?
    if [ $exitstatus -eq 0 ]; then
        clear
        sudo $( dirname "${BASH_SOURCE[0]}" )/$OPTION 2>&1 > /dev/tty
        sudo $( dirname "${BASH_SOURCE[0]}" )/../other/cleanup_installed.sh
        echo ""
        echo "Press any key to continue..." 2>&1 > /dev/tty
        read
    else
        exitstatus=1
    fi
done