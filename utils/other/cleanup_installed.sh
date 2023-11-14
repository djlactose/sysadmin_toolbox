#!/bin/bash

echo "Starting cleanup..."
tmp=($(sort /mnt/installed.txt | uniq))
for i in ${tmp[@]};do
    echo $i >> /mnt/installed.tmp
done
\mv /mnt/installed.tmp /mnt/installed.txt
echo "Cleanup done"