#!/bin/bash

# Check for exactly one argument
if [ "$#" -ne 1 ]; then
    echo "Error: Please provide exactly one log file."
    exit 1
fi

LOGFILE="$1"

# Validate file exists and is readable
if [ ! -f "$LOGFILE" ] || [ ! -r "$LOGFILE" ]; then
    echo "Error: Log file does not exist or is not readable."
    exit 1
fi

# Count total log entries
total_entries=$(wc -l < "$LOGFILE")

# Count log levels
info_count=$(grep -c " INFO " "$LOGFILE")
warning_count=$(grep -c " WARNING " "$LOGFILE")
error_count=$(grep -c " ERROR " "$LOGFILE")

# Get most recent ERROR message
recent_error=$(grep " ERROR " "$LOGFILE" | tail -n 1)

# Display results
echo "Log Summary:"
echo "Total entries: $total_entries"
echo "INFO messages: $info_count"
echo "WARNING messages: $warning_count"
echo "ERROR messages: $error_count"
echo "Most recent ERROR:"
echo "$recent_error"

# Generate report file
date_str=$(date +%Y-%m-%d)
report_file="logsummary_${date_str}.txt"

{
    echo "Log Summary Report - $date_str"
    echo "Total entries: $total_entries"
    echo "INFO messages: $info_count"
    echo "WARNING messages: $warning_count"
    echo "ERROR messages: $error_count"
    echo "Most recent ERROR:"
    echo "$recent_error"
} > "$report_file"

echo "Report generated: $report_file"
