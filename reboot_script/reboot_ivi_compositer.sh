#!/bin/bash

# This script is used to reboot the IVI compositer

lockfile="/tmp/IVICompositor.lock"

# Check for the existence of the lock file
if [ -e "$lockfile" ]; then
    echo "Another instance of this script is running. Exiting."
    exit 1
fi

# Create the lock file
touch "$lockfile"

# Define the process name to be checked and controlled
process_name="IVICompositor"

# Check if a process with the specified name is running
if pgrep -x "$process_name" > /dev/null
then
  # If the process is running, gracefully terminate it using pkill
  pkill -x "$process_name"
fi

# Change the working directory to '../build'
cd ../build

# Run the specified process with '-platform eglfs' and '&' to execute it in the background
./"$process_name" -platform eglfs &

# Remove the lock file
rm -f "$lockfile"