# !bin/bash

# * /******************************************************************/
# * Copyright         : <2024> <Everybody>
# * File Name         : <ollama_docker.sh>
# * Description       : <Setup Ollama and OpenWeb UI>
# *                    
# * Revision History  :
# * Date		Author 			Comments
# * ------------------------------------------------------------------
# * 05/11/2024	<iCarlosMendez>	<Insprired by ChatGPT>
# *
# * /******************************************************************/

# ##################################################### #
# Context

# Purpose: Local LLMs, what else?

# Prerequisites: Download and run the following script.
# wget https://raw.githubusercontent.com/icarlosmendez/admin_automation/master/scripts/ollama/ollama_docker.sh

# Barebones Ollama on linux
# curl -fsSL https://ollama.com/install.sh | sh

# Prep the dist for package install
# Add Docker's official GPG key:
sudo apt-get update
sudo apt-get install ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

# Add the repository to Apt sources:
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update

# Install Docker in preparation for the next step.
# Install "all" the Docker packages.
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

# Open WebUI running alone in a Docker container.
# Used when Ollama is installed on the Docker host.
docker run -d -p 3000:8080 --add-host=host.docker.internal:host-gateway -v open-webui:/app/backend/data --name open-webui --restart always ghcr.io/open-webui/open-webui:main

# Or this alternative command when you have issues connecting to ollama
docker run -d --network=host -v open-webui:/app/backend/data -e OLLAMA_BASE_URL=http://127.0.0.1:11434 --name open-webui --restart always ghcr.io/open-webui/open-webui:main

# Open WebUI bundled with Ollama in a single Docker container.
# docker run --device /dev/kfd --device /dev/dri --security-opt seccomp=unconfined -d -p 3000:8080 --gpus=all -v ollama:/root/.ollama -v open-webui:/app/backend/data --name open-webui --restart always ghcr.io/open-webui/open-webui:ollama

# First, create the volume that Portainer Server will use to store its database:
docker volume create portainer_data

# Then, download and install the Portainer Server container:
docker run -d -p 8000:8000 -p 9443:9443 --name portainer --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer-ce:latest


# # Open WebUI Native install (this doesn't work as of June 02, 2024)
# pip install open-webui
# open-webui serve

# # Another way to possibly install natively
# # Clone the Open WebUI repository
# git clone https://github.com/open-webui/open-webui.git

# # Navigate to the Open WebUI directory
# cd open-webui

# # Install dependencies
# sudo pip3 install -r requirements.txt

# # Run Open WebUI
# python3 app.py