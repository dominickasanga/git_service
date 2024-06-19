#!/bin/bash

# Find the PID of the Git daemon
PID=$(ps aux | grep '[g]it daemon' | awk '{print $2}')

# Check if a PID was found and kill the process
if [ -n "$PID" ]; then
  echo "Stopping Git daemon with PID: $PID"
  kill $PID
  # Optionally, force kill if the process does not stop
  # sleep 1
  # if ps -p $PID > /dev/null; then
  #   echo "Force killing Git daemon with PID: $PID"
  #   kill -9 $PID
  # fi
else
  echo "Git daemon is not running."
fi
