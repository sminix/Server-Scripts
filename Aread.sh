#!/bin/bash

IPnum="" #initialize number tracker
while read -r num
do 
    if [ $num != IPnum ]; #if there is an IP number, replace it
    then
	IPnum=$num
    fi
done
echo $IPnum #print the IP number, blank if none
