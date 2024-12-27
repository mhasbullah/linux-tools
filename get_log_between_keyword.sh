#!/bin/bash

# Check if the correct number of arguments is provided
if [ "$#" -ne 3 ]; then
  echo "Usage: $0 <start_keyword> <end_keyword> <file>"
  exit 1
fi

# Assign arguments to variables
start_keyword=$1
end_keyword=$2
file=$3

# Check if the file exists
if [ ! -f "$file" ]; then
  echo "Error: File '$file' not found!"
  exit 1
fi

# Use awk to extract lines between the keywords
awk -v start="$start_keyword" -v end="$end_keyword" '
  $0 ~ start {flag=1}
  flag {print}
  $0 ~ end {flag=0}
' "$file"
