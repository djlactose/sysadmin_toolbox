#!/bin/bash
. ../$(dirname $0)/utils.conf

wget https://download.microsoft.com/download/3/5/5/355d7943-a338-41a7-858d-53b259ea33f5/msodbcsql18_18.3.2.1-1_amd64.apk -O /tmp/msodbcsql18_18.3.2.1-1_amd64.apk
wget https://download.microsoft.com/download/3/5/5/355d7943-a338-41a7-858d-53b259ea33f5/mssql-tools18_18.3.1.1-1_amd64.apk -O /tmp/mssql-tools18_18.3.1.1-1_amd64.apk
echo \n | apk add --no-cache --allow-untrusted /tmp/msodbcsql18_18.3.2.1-1_amd64.apk /tmp/mssql-tools18_18.3.1.1-1_amd64.apk
apk add --no-cache python3-dev py3-pip gcc libc-dev g++ libffi-dev libxml2 unixodbc-dev
python3 -m pip install pyodbc pyopenssl
rm /tmp/msodbcsql18_18.3.2.1-1_amd64.apk
rm /tmp/mssql-tools18_18.3.1.1-1_amd64.apk