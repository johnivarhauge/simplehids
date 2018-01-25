#!/bin/bash

num=$(echo 'select count(*) from hashtable;' | sqlite3 hash.db)
echo 'select * from hashtable;' | sqlite3 hash.db > hash.txt

for (( c=1; c<$num+1; c++)) do 

	filenumber="$c"
	filenumber+="p"

	hash1=$(md5sum $(cut -f 1 -d '|' hash.txt | sed -n $filenumber | cut -f 1 -d " ") | cut -f 1 -d " ") 
	hash2=$(cut -f 2 -d '|' hash.txt | sed -n $filenumber)

	if [ "$hash1" != "$hash2" ]; then
	echo "$(cut -f 1 -d '|' hash.txt | sed -n $filenumber)"
	fi
done

rm hash.txt
echo "IDS-scan gjennomført"
