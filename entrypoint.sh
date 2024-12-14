#!/bin/bash

# Clone the shoopdaloop repository if it doesn't exist
if [ ! -d "/app/shoopdaloop" ]; then
    git clone https://github.com/SanderVocke/shoopdaloop.git /app/shoopdaloop
fi

# Activate the virtual environment and run aider
source /app/aider-chat/bin/activate
exec aider --browser
