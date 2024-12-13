FROM sandervocke/shoopdaloop_build_base_debian_bullseye_x86_64:latest

# Set the working directory
WORKDIR /app

# Create a virtual environment and install the required packages
RUN python3 -m venv /app/aider-chat && \
    /app/aider-chat/bin/pip install aider-chat aider-chat[browser]

# Clone the shoopdaloop repository
RUN git clone https://github.com/SanderVocke/shoopdaloop.git /app/shoopdaloop

# Set the working directory to the cloned repository
WORKDIR /app/shoopdaloop

# Set the entry point to activate the virtual environment and run aider
ENTRYPOINT ["/bin/bash", "-c", "source /app/aider-chat/bin/activate && aider --browser"]
