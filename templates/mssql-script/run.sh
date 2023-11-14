if [ ! -f "/usr/bin/python3" ]; then
    /mnt/utils/installers/install_py_mssql.sh
fi
pip install -r requirements.txt
python3 run_mssql.py
