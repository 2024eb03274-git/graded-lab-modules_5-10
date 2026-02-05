#!/bin/bash

INPUT="input.txt"

# Validate file
if [ ! -f "$INPUT" ] || [ ! -r "$INPUT" ]; then
  echo "Error: $INPUT does not exist or is not readable."
  exit 1
fi

# Normalize input: one word per line, lowercase, letters only
WORDS=$(tr -cs 'A-Za-z' '\n' < "$INPUT" | tr 'A-Z' 'a-z')

# Longest word
longest=$(echo "$WORDS" | awk '{ print length, $0 }' | sort -nr | head -n 1 | cut -d' ' -f2-)

# Shortest word
shortest=$(echo "$WORDS" | awk '{ print length, $0 }' | sort -n | head -n 1 | cut -d' ' -f2-)

# Average word length
avg=$(echo "$WORDS" | awk '{ total += length; count++ } END { if (count>0) printf "%.2f\n", total/count; else print 0 }')

# Unique word count
unique=$(echo "$WORDS" | sort | uniq | wc -l)

echo "Text Metrics:"
echo "Longest word: $longest"
echo "Shortest word: $shortest"
echo "Average word length: $avg"
echo "Total unique words: $unique"
