#!/bin/bash

for f in $1/*; do
  
  md5=($(md5sum $f))
  echo "insert into hashtable values('$f','$md5');" | sqlite3 hash.db 
done




