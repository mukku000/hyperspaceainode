#!/bin/bash

# Install Hyper Space Node
curl https://download.hyper.space/api/install | bash

# Load the updated environment

source /root/.bashrc

# Start the node
aios-cli start
