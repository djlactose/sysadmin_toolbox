#!/bin/bash
cleaned=sort /mnt/installed.txt | uniq | tee /mnt/installed.txt
echo $cleaned > /mnt/installed.txt