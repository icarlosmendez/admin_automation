#!/bin/bash

# * /******************************************************************/
# * Copyright         : <2024> <Everybody>
# * File Name         : <ollama_singularity.sh>
# * Description       : <Setup Ollama and OpenWeb UI>
# *                    
# * Revision History  :
# * Date		Author 			Comments
# * ------------------------------------------------------------------
# * 05/11/2024	<iCarlosMendez>	<Insprired by Data Scientists>
# *
# * /******************************************************************/

# ##################################################### #
# Context

# Purpose: Local LLMs, what else?

# Prerequisites: Download and run the following script.
# wget https://raw.githubusercontent.com/icarlosmendez/admin_automation/master/scripts/ollama/ollama_singularity.sh

# Prep the dist for package install
sudo apt-get update
sudo apt-get install -y ca-certificates \
    curl \
    socat \
    xdg-utils

# Create Singularity images from Docker images

# Convert OpenWebUI image from Docker to Singularity
singularity build open-webui.sif docker://ghcr.io/open-webui/open-webui:ollama

# Create volume directories for Singularity
mkdir -p /root/.ollama
mkdir -p /app/backend/data

# Stop existing Singularity instance if it exists
singularity instance stop open-webui || true
singularity instance delete open-webui || true

# Run OpenWebUI bundled with Ollama in Singularity
singularity instance start --fakeroot --net --network-args="portmap=3000:8000/tcp" --rocm -B /dev/kfd:/dev/kfd -B /dev/dri:/dev/dri -B /root/.ollama:/root/.ollama -B /app/backend/data:/app/backend/data open-webui.sif open-webui
singularity exec instance://open-webui /app/backend/start.sh

# Open OpenWebUI in the browser
xdg-open http://192.168.1.101:3000 &

echo "All services are up and running with Singularity!"