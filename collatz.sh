#!/usr/bin/env bash

i=1

if [ $# -gt 0 ]
then
        n=$1
else
        printf "\nEnter positive integer for Collatz function: "
        read n
fi

function when_even() {
        n_new=$(bc <<< "$n/2")
        n=$n_new
}

function when_odd() {
        n_new=$(bc <<< "(3*$n)+1")
        n=$n_new
}

while [ $n -gt 1 ]
do
        if [ $((n%2)) -eq 0 ]
        then
                when_even
        else
                when_odd
        fi
        printf "$i: $n \n"
        (( i++ ))
done
