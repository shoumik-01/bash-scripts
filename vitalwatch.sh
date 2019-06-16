#!/usr/bin/env bash

OUTPUT=$1

while true
do
        DATE=$(date +"[%d/%b/%Y:%k:%M:%S %Z]")
        CPU=$(top -b -n 1 | grep -i cpu | head -1 | awk '{print $2}')
        MEM=$(vmstat -s | head -2 | grep used | awk '{print $1}')
        echo "$DATE: $CPU, $MEM" >> $OUTPUT
        sleep 1
done
