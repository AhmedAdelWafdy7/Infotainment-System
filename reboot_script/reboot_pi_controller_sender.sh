#!/bin/bash

# This script is used to reboot the PI controller sender

lockfile="/tmp/PiracerController.lock"

# Check for the existence of the lock file
if [ -e "$lockfile" ]; then
    echo "Another instance of this script is running. Exiting."
    exit 1
fi

# Create the lock file
touch "$lockfile"

# Define the name of the process to be managed
process_name="PiracerController"

# Check if a process with the specified name is already running
if pgrep -x "$process_name" > /dev/null
then
  # If the process is running, gracefully terminate it using pkill
  pkill -x "$process_name"
fi

# Change the working directory to '../build' where the target binary is located
cd ../build

# Run the specified process in the background
./"$process_name" &

# Sleep for 3 seconds to allow the process to start and run in the background
sleep 3

# Remove the lock file
rm -f "$lockfile"