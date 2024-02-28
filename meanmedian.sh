#!/usr/bin/env bash

read -p "Enter a sequence of numbers (separated by spaces): " input_sequence

IFS=' ' read -r -a numbers <<< "$input_sequence"
sum=0

for num in "${numbers[@]}"
do
        sum=$(echo "$sum + $num" | bc)
done

mean=$(echo "scale=2; $sum / ${#numbers[@]}" | bc)

sorted_numbers=($(for num in "${numbers[@]}"; do echo $num; done | sort -n))
length=${#sorted_numbers[@]}

if ((length % 2 == 0))
then
        median=$(echo "scale=2; (${sorted_numbers[length/2-1]} + ${sorted_numbers[length/2]}) / 2" | bc)
else
        median=$(echo "scale=2; ${sorted_numbers[length/2]}" | bc)
fi

echo "Mean: $mean"
echo "Median: $median"
