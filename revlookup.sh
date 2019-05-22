#!/usr/bin/env bash

FILE=$1
for i in `cat $FILE`; do nslookup $i | grep "name" | awk '{print $4}'; printf " -- $i \n\n"; done
