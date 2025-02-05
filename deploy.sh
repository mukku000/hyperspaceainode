#!/bin/bash

# Install Hyperspace
curl -sSL https://download.hyper.space/api/install | bash

source /root/.bashrc

# Run aios-cli start in the background
aios-cli start &

# Wait a bit for the node to start (adjust as needed) - important!
sleep 10 # Increased wait time

# Run other aios-cli commands (no screen needed)
aios-cli models add hf:TheBloke/phi-2-GGUF:phi-2.Q4_K_M.gguf
aios-cli hive connect
aios-cli hive select-tier 5

# Optional Tier 3 upgrade (comment out if not needed)
# aios-cli hive select-tier 3 # Commented out by default

aios-cli hive points

echo "Hyperspace node setup initiated in the background."
echo "To check the status of the node, use the appropriate aios-cli commands or check logs."
echo "You can check the background processes using: ps aux | grep aios-cli" # Helpful command
