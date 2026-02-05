#!/bin/bash

# Validate arguments
if [ "$#" -ne 2 ]; then
  echo "Error: Please provide exactly two directories (dirA dirB)."
  exit 1
fi

DIRA="$1"
DIRB="$2"

# Validate directories
if [ ! -d "$DIRA" ] || [ ! -d "$DIRB" ]; then
  echo "Error: One or both paths are not valid directories."
  exit 1
fi

echo "Files only in $DIRA:"
for f in "$DIRA"/*; do
  name=$(basename "$f")
  if [ -f "$f" ] && [ ! -f "$DIRB/$name" ]; then
    echo "$name"
  fi
done

echo
echo "Files only in $DIRB:"
for f in "$DIRB"/*; do
  name=$(basename "$f")
  if [ -f "$f" ] && [ ! -f "$DIRA/$name" ]; then
    echo "$name"
  fi
done

echo
echo "Files present in both directories (content check):"
for f in "$DIRA"/*; do
  name=$(basename "$f")
  if [ -f "$f" ] && [ -f "$DIRB/$name" ]; then
    if cmp -s "$f" "$DIRB/$name"; then
      echo "$name : MATCH"
    else
      echo "$name : DIFFER"
    fi
  fi
done
