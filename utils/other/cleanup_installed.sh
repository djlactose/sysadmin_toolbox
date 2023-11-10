#!/bin/bash
cleaned=$(sort /mnt/installed.txt | uniq)
echo $cleaned > /mnt/installed.txt