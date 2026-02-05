#!/bin/bash

INPUT="emails.txt"
VALID="valid.txt"
INVALID="invalid.txt"

# Check input file
if [ ! -f "$INPUT" ] || [ ! -r "$INPUT" ]; then
  echo "Error: $INPUT does not exist or is not readable."
  exit 1
fi

# Regex: letters/digits + @ + letters + .com
# Use -E for extended regex
VALID_REGEX='^[A-Za-z0-9]+@[A-Za-z]+\.com$'

# Extract valid emails (may contain duplicates), then dedupe
grep -E "$VALID_REGEX" "$INPUT" | sort | uniq > "$VALID"

# Extract invalid emails (everything else)
grep -Ev "$VALID_REGEX" "$INPUT" > "$INVALID"

echo "Done."
echo "Valid emails saved to: $VALID"
echo "Invalid emails saved to: $INVALID"
echo "Unique valid count: $(wc -l < "$VALID")"
echo "Invalid count: $(wc -l < "$INVALID")"
