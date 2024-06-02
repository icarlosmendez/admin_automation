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
sudo apt-get install -y ca-certificates curl

# Install Singularity
sudo apt-get install -y singularity-container

# Create Singularity images from Docker images

# Convert OpenWebUI image from Docker to Singularity
singularity build open-webui.sif docker://ghcr.io/open-webui/open-webui:ollama

# Create volume directories for Singularity
mkdir -p /root/.ollama
mkdir -p /app/backend/data

# Run OpenWebUI bundled with Ollama in Singularity
singularity instance start --rocm -B /dev/kfd:/dev/kfd -B /dev/dri:/dev/dri -B /root/.ollama:/root/.ollama -B /app/backend/data:/app/backend/data open-webui.sif open-webui
# singularity exec instance://open-webui openwebui start
singularity exec instance://open-webui bash -c "socat TCP-LISTEN:3000,fork TCP:127.0.0.1:8080" &

# Install and run Portainer Server using Singularity

# Convert Portainer image from Docker to Singularity
singularity build portainer.sif docker://portainer/portainer-ce:latest

# Create volume directory for Portainer
mkdir -p /var/run/portainer_data

# Run Portainer Server in Singularity
singularity instance start --writable-tmpfs -B /var/run/docker.sock:/var/run/docker.sock -B /var/run/portainer_data:/data portainer.sif portainer
singularity exec instance://portainer /portainer/portainer --bind 192.168.1.101:9443 &

# Open OpenWebUI in the browser
xdg-open http://192.168.1.101:3000 &

# Open Portainer in the browser
xdg-open https://192.168.1.101:9443 &

echo "All services are up and running with Singularity!"
