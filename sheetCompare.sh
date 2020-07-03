#!/bin/bash

sheet1="$1" #takes two arguments for the input
sheet2="$2"
while IFS=$"\t"  read -r line1
do
    keyword=`echo "$line1" | awk '{print $1}'` #get keyword from the first column of the first spreadsheet
    if [[ "$keyword" != "doweb1" && "$keyword" != "doweb2" && "$keyword" != "CF10Live" && "$keyword" != "DOWEB1" && "$keyword" != "cf10live" ]]; #if the keyword is not any of the proper words
    then
	continue #continue
    fi
    url1=`echo "$line1" | awk '{print $2}'` #get the url from the second column
    match=0 #initiate match as 0

    while read -r line2 #read from second spreadsheet
    do
	url2=`echo "$line2" | awk '{print $1}'` #get second url from first column of spreadsheet 2
        if [[ "$url1" != "$url2" ]]; #if the url's are not equal
	then
	    continue #continue to next word in spreadsheet 2
	else
	    match=1 #if they match, match is set to 1 and break out of spread sheet 2
	    break
	fi
    done < $sheet2
    if [[ $match -eq 0 ]]; #if match is still 0
    then
	echo $url1 #echo url1, because it is not found on the second spreadsheet
    else
	echo "match" #else, say there is a match
    fi
done < $sheet1
