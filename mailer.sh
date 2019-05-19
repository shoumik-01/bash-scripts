#!/usr/bin/env bash

printf "\nEnter email address: "
read email
printf "\nHow many emails should be sent: "
read n
printf "\nDelay between emails (0 for no delay): "
read delay

i=1
while [ $i -le $n ]
do
        echo "This is a test email. No action is required." | mail -s "Test email pls ignore" $email
        sleep $delay
        (( i++ ))
done
