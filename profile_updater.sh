#!/usr/bin/env bash

ls -1 /home >> /tmp/users.txt

for i in `cat /tmp/users.txt`
do
        grep "^[^#;]" /home/$i/.bash_profile | grep "forfun.sh"
        if [ $? -eq 0 ]; then
                sleep 1
        else
                echo "/opt/shared/forfun.sh" >> /home/$i/.bash_profile
        fi
done
rm -f /tmp/users.txt
