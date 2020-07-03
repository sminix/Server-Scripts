#!/bin/bash
#takes in a spreadsheet with domain names in first column and outputs ip addresses
while read -r l
do
    d=`echo "$l" | awk '{print $1}'` 
    echo $d #print website
    dig "$d" a +short @8.8.8.8 | ./Aread.sh #dig without www.
    d=`echo $d | sed -e 's/^/www./'`
    dig "$d" a +short @8.8.8.8 | ./Aread.sh #with www.
done 
