#!/bin/bash

INPUT="input.txt"

# Validate input file
if [ ! -f "$INPUT" ] || [ ! -r "$INPUT" ]; then
  echo "Error: $INPUT does not exist or is not readable."
  exit 1
fi

# Normalize input: one word per line, lowercase, letters only
WORDS=$(tr -cs 'A-Za-z' '\n' < "$INPUT" | tr 'A-Z' 'a-z')

# Only vowels (a, e, i, o, u)
echo "$WORDS" | grep -E '^[aeiou]+$' > vowels.txt

# Only consonants
echo "$WORDS" | grep -E '^[bcdfghjklmnpqrstvwxyz]+$' > consonants.txt

# Mixed (contains vowels and consonants) AND starts with a consonant
echo "$WORDS" | grep -E '^[bcdfghjklmnpqrstvwxyz][a-z]*$' \
  | grep -E '[aeiou]' > mixed.txt

echo "Pattern extraction complete."
echo "Vowels-only words: $(wc -l < vowels.txt)"
echo "Consonants-only words: $(wc -l < consonants.txt)"
echo "Mixed words starting with consonant: $(wc -l < mixed.txt)"
