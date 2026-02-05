#!/bin/bash

# Validate argument count
if [ "$#" -ne 1 ]; then
  echo "Error: Please provide exactly one directory path."
  exit 1
fi

DIR="$1"

# Validate directory
if [ ! -d "$DIR" ]; then
  echo "Error: $DIR is not a valid directory."
  exit 1
fi

BACKUP="$DIR/backup"

# Create backup directory if it doesn't exist
mkdir -p "$BACKUP"

echo "Script PID: $$"
echo "Moving files to backup directory in background..."

# Move each file in background
for file in "$DIR"/*; do
  if [ -f "$file" ]; then
    mv "$file" "$BACKUP/" &
    echo "Started move for $(basename "$file") with PID $!"
  fi
done

# Wait for all background jobs
wait

echo "All background move operations completed."
