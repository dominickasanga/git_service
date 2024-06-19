#!/bin/bash

# Define the log directory and log file
LOGDIR="logs/git/"
LOGFILE="$LOGDIR/git-daemon.log"

# Create the log directory if it doesn't exist
mkdir -p "$LOGDIR"

# Ensure the log directory is writable (optional, but useful for debugging permissions issues)
chmod -R u+w "$LOGDIR"

# Run the git daemon and log output to the log file
/usr/bin/git daemon --verbose --export-all --log-destination=stderr >> "$LOGFILE" 2>&1
