#!/bin/bash
cut -d$'\t' -f 2 $1 > holder.txt
while IFS=$'\t'  read -r l
do
    for word in $l
    do
	if grep -q "@" <<< "$word"
	then
	    echo $word
        fi
    done
done < holder.txt
