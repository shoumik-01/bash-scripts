#!/bin/ash

NORMIE=$(nslookup Samsung-9-Pro-5G | grep -i address | grep -v "#53" | awk '{print $3}')

FILE=/tmp/track.log
printf "\nRun tail -f $FILE to keep an eye on the normie lol\n"

rm -f $FILE
touch $FILE

while true
do
        doot=$(date +"[%d/%b/%Y:%H:%M:%S]")
        ping -W 2 -c 4 $NORMIE > /dev/null
        if [ $? -eq 0 ]; then
                echo "$doot: $NORMIE is up" >> $FILE
        else
                echo "$doot: $NORMIE is down" >> $FILE
        fi
        echo "------" >> $FILE
        sleep 20
done
