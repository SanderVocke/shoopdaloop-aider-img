FROM sandervocke/shoopdaloop_build_base_debian_bullseye_x86_64:latest

# Set the working directory
WORKDIR /app

# Create a virtual environment and install the required packages
RUN python3 -m venv /app/aider-chat && \
    /app/aider-chat/bin/pip install aider-chat aider-chat[browser]

# Copy the entrypoint script into the container
COPY entrypoint.sh /app/entrypoint.sh
RUN chmod +x /app/entrypoint.sh

# Set the entry point to the new script
ENTRYPOINT ["/app/entrypoint.sh"]
