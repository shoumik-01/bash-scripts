#!/usr/bin/env bash

cp /etc/resolv.conf /root/resolv.conf.old
cat <<'EOF'> /etc/resolv.conf
search $CHANGE_ME
nameserver 10.0.0.1
nameserver 10.0.0.2
EOF

i=$(cat /etc/redhat-release | awk 'BEGIN {FS="."}{print $1}' | grep -o '[0-9]\+')

#echo $i
if [[ "$i" == '7' ]]; then
   systemctl stop NetworkManager.service
   systemctl disable NetworkManager.service
elif [[ "$i" == '6' ]]; then
   service NetworkManager stop
   chkconfig NetworkManager off
fi
