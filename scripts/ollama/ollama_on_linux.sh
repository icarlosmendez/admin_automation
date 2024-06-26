# !bin/bash

# * /******************************************************************/
# * Copyright         : <2024> <Everybody>
# * File Name         : <ollama_on_linux.sh>
# * Description       : <Setup Ollama on Linux Natively>
# *                    
# * Revision History  :
# * Date		Author 			Comments
# * ------------------------------------------------------------------
# * 06/07/2024	<iCarlosMendez>	<Insprired by Matt Williams>
# *
# * /******************************************************************/

# ##################################################### #
# Context

# Purpose: Install Ollama natively on a Linux install, bare metal or vm.

# Prerequisites: A working, configured instance of Linux. 
# Pick your favorite distro. It will need to be capable of hosting GPU dirvers. 
# In my case, that is the ROCm suite by AMD.

# * Download the script to your Linux host.
# wget https://raw.githubusercontent.com/icarlosmendez/admin_automation/master/scripts/ollama/ollama_on_linux.sh

# * Make the file executable
# sudo chmod +x ollama_on_linux.sh

# * Execute the script
# sudo bash ollama_on_linux.sh

# ##################################################### #
# The Script

# Install Ollama running this one-liner:
curl -fsSL https://ollama.com/install.sh | sh

# Adding Ollama as a startup service (recommended)
# Create a user for Ollama:
sudo useradd -r -s /bin/false -m -d /usr/share/ollama ollama

# Create a service file in /etc/systemd/system/ollama.service:
cat <<EOF | sudo tee /etc/systemd/system/ollama.service
[Unit]
Description=Ollama Service
After=network-online.target

[Service]
ExecStart=/usr/bin/ollama serve
User=ollama
Group=ollama
Restart=always
RestartSec=3
Environment="0.0.0.0"

[Install]
WantedBy=default.target
EOF

# Then start the service:
sudo systemctl daemon-reload
sudo systemctl enable ollama

# Start Ollama
# Start Ollama using systemd:
sudo systemctl start ollama

# Ask the user for the model file name
read -p "Enter a model file name to pull so you can get started with Ollama: " model
# Pull the LLM model file using Ollama
sudo ollama pull $model

# Remove the script
sudo rm ollama_on_linux.sh