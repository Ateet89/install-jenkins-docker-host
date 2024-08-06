#!/bin/bash

# Get the Docker group ID from the environment variable
DOCKER_GID=${DOCKER_GID:-999} # Default to 999 if not set

# Create Docker group with the specified GID if it doesn't exist
if ! getent group docker > /dev/null 2>&1; then
    groupadd -g $DOCKER_GID docker
fi

# Add Jenkins user to the Docker group
usermod -aG docker jenkins

# Execute the original command
exec "$@"
