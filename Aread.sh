#!/bin/bash

IPnum="" #initialize number tracker
while read -r num
do 
    if [ $num != IPnum ]; #if there is an IP number, replace it
    then
	for val in $numbers
	do
	    if [ $val == ${num:0:1} ];#check that the first value is a number
	    then 
		allIP+=($num)
    	    fi
	done
    fi
done
echo $IPnum #print the IP number, blank if none
