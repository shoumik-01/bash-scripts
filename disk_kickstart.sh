#!/usr/bin/env bash
#Useful for a kickstart pre-script to detect the type of drive
#Either NVMe or SATA drive
#Code from a Red Hat KB user

DIR="/sys/block"
MINSIZE=60

for DEV in $DIR/sd* $DIR/nvme*; do
  DEV=`echo "$DEV" | awk -F'/' '{print $NF}'`
  if [ -d $DIR/$DEV ]; then
    REMOVABLE=`cat $DIR/$DEV/removable`
    if (( $REMOVABLE == 0 )); then
      echo $DEV
      SIZE=`cat $DIR/$DEV/size`
      GB=$(($SIZE/2**21))
      if [ $GB -gt $MINSIZE ]; then
        echo "$(($SIZE/2**21))"
        if [ -z $ROOTDRIVE ]; then
          ROOTDRIVE=$DEV
        fi
      fi
    fi
  fi
done
