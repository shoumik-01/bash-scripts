#!/usr/bin/env bash

calculate_statistics() {
    local numbers=("$@")

    # Calculate sum, mean, and sort the numbers
    sum=0
    for num in "${numbers[@]}"
    do
        sum=$(echo "$sum + $num" | bc)
    done
    mean=$(echo "scale=2; $sum / ${#numbers[@]}" | bc)
    sorted_numbers=($(for num in "${numbers[@]}"; do echo $num; done | sort -n))

    # Calculate median
    length=${#sorted_numbers[@]}
    if ((length % 2 == 0))
    then
        median=$(echo "scale=2; (${sorted_numbers[length/2-1]} + ${sorted_numbers[length/2]}) / 2" | bc)
    else
        median=$(echo "scale=2; ${sorted_numbers[length/2]}" | bc)
    fi

    # Calculate maximum and minimum
    max=${sorted_numbers[length-1]}
    min=${sorted_numbers[0]}

    # Calculate standard deviation
    deviation_sum=0
    for num in "${numbers[@]}"
    do
        deviation_sum=$(echo "$deviation_sum + ($num - $mean)^2" | bc)
    done
    variance=$(echo "scale=2; $deviation_sum / (${#numbers[@]} - 1)" | bc)
    stddev=$(echo "scale=2; sqrt($variance)" | bc)

    # Print results
    echo "Mean: $mean"
    echo "Median: $median"
    echo "Maximum: $max"
    echo "Minimum: $min"
    echo "Standard Deviation: $stddev"
}

read -p "Enter a sequence of numbers (separated by spaces): " input_sequence
IFS=' ' read -r -a numbers <<< "$input_sequence"

calculate_statistics "${numbers[@]}"
