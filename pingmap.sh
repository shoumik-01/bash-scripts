#!/usr/bin/env bash

printf "PINGMAP V1.0"
printf "\nIP address of the host to be monitored: "
read IP
printf "\nSave log file at: "
read dir
printf "\nName of log file: "
read file
touch $dir/$file
while true
do
        ping -c 4 "$IP" > /dev/null
        if [ $? -eq 0 ]; then
                doot=$(date +"[%d/%b/%Y:%k:%M:%S %Z]")
                echo "$doot: $IP is up" >> $dir/$file
        else
                doot=$(date +"[%d/%b/%Y:%k:%M:%S %Z]")
                echo "$doot: $IP is down" >> $dir/$file
        fi
        echo "------" >> $dir/$file
        sleep 30
done
