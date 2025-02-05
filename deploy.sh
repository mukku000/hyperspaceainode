#!/bin/bash

# Install Hyperspace
curl -sSL https://download.hyper.space/api/install | bash

source /root/.bashrc

# Check if screen is installed. If not, install it.
if ! command -v screen &>/dev/null; then
  echo "Installing screen..."
  apt-get update && apt-get install -y screen  # Or yum install screen, depending on your distro
fi

# Create and detach a screen session
screen -dmS hyperspace aios-cli start

# Wait a bit to ensure the screen session starts (adjust as needed)
sleep 5

# Run commands in the detached screen session
screen -S hyperspace -X stuff "aios-cli models add hf:TheBloke/phi-2-GGUF:phi-2.Q4_K_M.gguf$(printf '\r')"
screen -S hyperspace -X stuff "aios-cli hive connect$(printf '\r')"
screen -S hyperspace -X stuff "aios-cli hive select-tier 5$(printf '\r')"

# Optional Tier 3 upgrade (comment out if not needed)
# screen -S hyperspace -X stuff "aios-cli hive select-tier 3$(printf '\r')" # Commented out by default

screen -S hyperspace -X stuff "aios-cli hive points$(printf '\r')"

echo "Hyperspace node setup initiated in a detached screen session named 'hyperspace'."
echo "You can reattach to the screen session using: screen -r hyperspace"
echo "To view logs: screen -ls and then screen -r <session_id>"
