#!/usr/bin/env bash

function eagle() {
        echo "CPU utilization is at $CPU%" | mail -s "High CPU usage alert" ops_server_unix@elementcorp.com
        DATE=$(date +"%d_%b_%Y_%H_%M_%S")
        mkdir -p /nixpatrol/$DATE
        trace-cmd record >> /nixpatrol/$DATE/trace.log
        ps -ef | grep kworker | grep -v grep | awk '{print $2}' >> /nixpatrol/$DATE/kwrkr_pids.txt
        for i in `cat /nixpatrol/$DATE/kwrkr_pids.txt`; do cat /proc/$i/stack >> /nixpatrol/$DATE/$i.txt; done
#sar -p -d 1 2 >> /nixpatrol/$DATE/sar.txt
#iotop -o -b | grep -i kworker >> /nixpatrol/$DATE/iotop.txt
}
while true
do
        CPU=`vmstat 1 2 -a | tail -1 | awk '{print $13+$14}'`
                if [ "$CPU" -ge 80 ] ; then
                        eagle
                fi
        sleep 60
done
