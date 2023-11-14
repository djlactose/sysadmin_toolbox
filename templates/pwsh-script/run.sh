if [ ! -f "/usr/bin/pwsh" ]; then
    /mnt/utils/installers/install_pwsh.sh
fi
pwsh run.ps1
