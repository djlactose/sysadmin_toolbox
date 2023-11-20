#!/bin/bash
path=$( dirname "${BASH_SOURCE[0]}" )
if [ ! -f "/usr/bin/python3" ]; then
    /mnt/utils/installers/install_py_mssql.sh
fi
pip install -r $path/requirements.txt
python3 $path/run_mssql.py
