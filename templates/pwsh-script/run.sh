if [ ! -f "/usr/bin/pwsh" ]; then
    /mnt/utils/installers/install_pwsh.sh
fi
pwsh $path/run.ps1
