#!/usr/bin/env bash

OUTPUT=$1
k=1024

while true
do
        DATE=$(date +"[%d/%b/%Y:%k:%M:%S %Z]")
        CPU=$(top -n1 | grep -i cpu | head -1 | awk '{print $2}')
        MEMK=$(vmstat -s | head -2 | grep used | awk '{print $1}')
        MEMB=$(awk -v dividend="${MEMK}" -v divisor="${k}" 'BEGIN {printf "%.2f", dividend/divisor; exit(0)}')
        echo "$DATE: $CPU, $MEMB" >> $OUTPUT
        sleep 1
done
