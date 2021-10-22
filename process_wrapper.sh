#!/bin/bash

PRCS=$(ps | grep normie_watch | grep -v "grep")
PID=$(ps | grep normie_watch | grep -v "grep" | awk '{print $1}')

function action_running() {
        printf "\nCurrently running normie related process is $PRCS\n"
        printf "\nKill the process? y/n \n"
        read cmd
        case $cmd in
                "y") kill -9 $PID; printf "\nProcess killed!\n";;
                "n") printf "\nDoing nothing\n";;
                *) printf "Only lowercase y or n is allowed\n";;
        esac
}

function action_down() {
        printf "\nNo normie related processes are running. Start process? y/n \n"
        read cmd
        case $cmd in
                "y") /root/scripts/normie_watch.sh &;;
                "n") printf "\nDoing nothing\n";;
                *) printf "Only lowercase y or n is allowed\n";;
        esac
}

ps | grep normie_watch | grep -v "grep" > /dev/null
if [ $? -eq 0 ]; then
        action_running
else
        action_down
fi

exit 0
