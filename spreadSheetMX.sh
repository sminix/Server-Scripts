#!/bin/bash

while read -r l
do
    d=`echo "$l" | awk '{print $1}'` #get domain name from spreadsheet line
    dig "$d" MX +short @8.8.8.8 | ./MXread.sh #dig domain and pipe to another script to read it
done
