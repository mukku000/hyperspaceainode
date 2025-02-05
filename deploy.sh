#!/bin/bash

# Install Hyper Space Node
curl https://download.hyper.space/api/install | bash

# Load the updated environment
source /root/.bashrc

# Start the node
aio-cli start

# Download the required model
aio-cli models add hf:TheBloke/phi-2-GGUF:phi-2.Q4_K_M.gguf

# Import private key (Ensure my.pem exists beforehand)
echo "Make sure you have created my.pem file with your private key."
aio-cli hive import-keys ./my.pem

# Set imported keys as preferred for this session
aio-cli hive login

# Ensure the model is registered
aio-cli hive connect

# Select Tier 5
aio-cli hive select-tier 5

# Optionally, downgrade to Tier 3 for 2x points
aio-cli hive select-tier 3

# Check current multiplier and points
aio-cli hive points

# Completion message
echo "Node setup completed successfully!"
