#!/bin/bash

# This script is used to reboot the head unit

lockfile="/tmp/HeadUnit.lock"



# Check for the existence of the lock file
if [ -e "$lockfile" ]; then
    echo "Another instance of this script is running. Exiting."
    exit 1
fi

# Create the lock file
touch "$lockfile"

# Define the process name to be checked and controlled
process_name="HeadUnit"

# Check if a process with the specified name is running
if pgrep -x "$process_name" > /dev/null
then
  # If the process is running, gracefully terminate it using pkill
  pkill -x "$process_name"
fi

export LIBGL_ALWAYS_SOFTWARE=1

# Change the working directory to '../build'
cd ../build

# Run the specified process with '-platform wayland' and '&' to execute it in the background
./"$process_name" -platform wayland &

# Remove the lock file
rm -f "$lockfile"