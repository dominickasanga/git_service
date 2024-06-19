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

# Function to run git daemon and capture network traffic
run_git_daemon() {
    /usr/bin/git daemon --verbose --export-all --log-destination=stderr 2>&1 | while IFS= read -r line; do
        timestamp="$(get_timestamp)"
        echo "[$timestamp] $line" >> "$LOGFILE"
        echo "[$timestamp] $line"  # Optional: Print to terminal as well
    done
}

# Monitor network traffic related to git daemon using tcpdump
monitor_network_traffic() {
    tcpdump -i any port 9418 -l -A -s 0 | while IFS= read -r line; do
        timestamp="$(get_timestamp)"
        echo "[$timestamp] [Network Traffic] $line" >> "$LOGFILE"
        echo "[$timestamp] [Network Traffic] $line"  # Optional: Print to terminal as well
    done
}

# Run both git daemon and network traffic monitor in parallel
run_git_daemon &  # Run git daemon in background
monitor_network_traffic  # Monitor network traffic

# Optionally, you can wait for git daemon to finish before exiting
wait
