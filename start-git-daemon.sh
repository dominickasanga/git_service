#!/bin/bash

# Define the log directory and log file
LOGDIR="logs/git/"
LOGFILE="$LOGDIR/git-daemon.log"

# Create the log directory if it doesn't exist
mkdir -p "$LOGDIR"

# Ensure the log directory is writable (optional, but useful for debugging permissions issues)
chmod -R u+w "$LOGDIR"

# Function to get current timestamp
get_timestamp() {
    date +"%Y-%m-%d %H:%M:%S"
}

# Run the git daemon and log output to the log file with timestamp
/usr/bin/git daemon --verbose --export-all --log-destination=stderr 2>&1 | while IFS= read -r line; do
    timestamp="$(get_timestamp)"
    echo "[$timestamp] $line" >> "$LOGFILE"
    echo "[$timestamp] $line"  # Optional: Print to terminal as well
done
