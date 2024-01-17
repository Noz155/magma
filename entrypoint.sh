#!/bin/bash

cd /home/container || exit 1  # Exit if the directory doesn't exist or cannot be accessed

# Replace Startup Variables
MODIFIED_STARTUP=$(eval "echo \"${STARTUP}\"" | sed -e 's/{{/${/g' -e 's/}}/}/g')
echo ":/home/container\$ ${MODIFIED_STARTUP}"  # Escape the dollar sign to avoid variable expansion in echo

# Run the Server
eval "${MODIFIED_STARTUP}"  # Use eval to execute the modified command
