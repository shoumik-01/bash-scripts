#!/usr/bin/env bash

# Function to generate a random number between 1 and 20
function generate_random_number() {
  echo $(( ( RANDOM % 20 ) + 1 ))
}

# Initialize an array to store assigned numbers
assigned_numbers=()

# Initialize a counter for the loop
counter=0

# Create or overwrite the CSV file
echo "Name,Assignment" > assignments.csv

# Loop for 20 iterations
while [ $counter -lt 20 ]; do
  # Prompt user for name input
  read -p "Enter name: " name

  # Generate random number
  random_number=$(generate_random_number)

  # Check if the generated number has already been assigned
  while [[ " ${assigned_numbers[@]} " =~ " $random_number " ]]; do
    random_number=$(generate_random_number)
  done

  # Add the generated number to the assigned numbers array
  assigned_numbers+=($random_number)

  # Append name and assignment to the CSV file
  echo "$name,$random_number" >> assignments.csv

  # Increment counter
  ((counter++))
done

echo "Assignments have been written to assignments.csv"
