#!/bin/bash

# Check if input files exist
if [ ! -f "input.csv" ]; then
    echo "Error: input.csv not found"
    exit 1
fi

if [ ! -f "flex.csv" ]; then
    echo "Error: flex.csv not found"
    exit 1
fi

# Create or clear temp_flex.csv
> temp_flex.csv

# Read numbers from input.csv
while IFS= read -r number || [ -n "$number" ]; do
    # Skip empty lines
    [ -z "$number" ] && continue
    
    # Remove any whitespace
    number=$(echo "$number" | tr -d '[:space:]')
    
    # Search for the number in flex.csv between pipes
    while IFS= read -r line || [ -n "$line" ]; do
        # Skip empty lines in flex.csv
        [ -z "$line" ] && continue
        
        # Check if line contains the number between pipes
        if echo "$line" | grep -q "|$number|"; then
            # Extract fields
            field1=$(echo "$line" | cut -d'|' -f1)
            field2=$(echo "$line" | cut -d'|' -f2)
            field3=$(echo "$line" | cut -d'|' -f3)
            
            # Rearrange fields (b|a|c) and write to temp file
            echo "${field2}|${field1}|${field3}|" >> temp_flex.csv
        fi
    done < flex.csv
done < input.csv

# Check if any matches were found
if [ ! -s temp_flex.csv ]; then
    echo "No matches found"
    exit 0
fi

echo "Processing complete. Results saved in temp_flex.csv"
echo "Found $(wc -l < temp_flex.csv) matches"
