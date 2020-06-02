#!/bin/bash
#Use this script to determine the highest priority host based on MX
#Pipe output from dig MX +short as input
pref=1000
hostName=""
while read -r value url
do
    if [ $value -lt $pref ];
    then
	pref=$value
        hostName=$url
    fi
done
echo $hostName
