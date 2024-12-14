#!/bin/bash

# Check if a repository URL is provided as an argument
REPO_URL=$1

# If a repository URL is provided, clone it
if [ -n "$REPO_URL" ]; then
    if [ ! -d "/app/repo" ]; then
        git clone "$REPO_URL" /app/repo
    fi
    WORKDIR="/app/repo"
else
    # Create a new empty directory if no URL is provided
    WORKDIR="/app/new_project"
    mkdir -p "$WORKDIR"
fi

# Activate the virtual environment and run aider
source /app/aider-chat/bin/activate
cd "$WORKDIR"
exec aider --browser
