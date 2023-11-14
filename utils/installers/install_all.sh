#!/bin/bash

for f in $(ls $( dirname "${BASH_SOURCE[0]}" )/*.sh |grep -v install_all.sh |grep -v run.sh); do
    bash -c "$f"
done