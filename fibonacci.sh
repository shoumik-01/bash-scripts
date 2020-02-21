#!/usr/bin/env bash

f0=0
f1=1
i=1

printf "\nHow many Fibonacci numbers do you want (max 93): "
read n

while [ $i -le $n ]
do
        printf "$((i-1)): $f0 \n"
        fnew=$(bc <<< "$f0+$f1")
        f0=$f1
        f1=$fnew
        (( i++ ))
done
