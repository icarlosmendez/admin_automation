Notes on ways and techniques to navigate the Proxmox VE

# To access the Proxmox web interface, you can:
Open an internet browser on another local device.
Enter the local IP and port combination in the URL bar.
Enter the password created during Proxmox installation.
Click Login. 
The default login is root, and the password is specified during the installation process.

# Here are some ways to log into a container in Proxmox:
SSH: Attach to the container through Proxmox host or allow login with a password on the container.
Console: Use the web GUI, pct console, or lxc-console.
Command line: Attach directly from the command line via pct enter or lxc-attach. 
