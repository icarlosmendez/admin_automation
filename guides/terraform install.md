This is a very simple guide to support the use of the Terraform install script 
which is located in the helper_scripts directory.

The point of this is to get Proxmox ready to work according to Techno Tim 
and his great guide on setting up Proxmox titled "Before I do anything on Proxmox, I do this first"
That video can be found here: https://www.youtube.com/watch?v=GoZaMgEgrHw 
And the notes with the commands he uses to get everything sorted out can be found here: 
https://technotim.live/posts/first-11-things-proxmox/

His guide consists of a number (11) of things that are just good practice when setting a new Proxmox Server instance. I love having a good collection of best practices to follow, and I love it even more when I don't have to do everything by hand from scratch ever single time I need to tear down a box and build it back up.

To that end, I put together the script in question to facilitate the initial 
administrative set up of Proxmox server and subsequently the install of Terraform
to allow for repeatable and reliable "Infrastructure as Code."

Using the GUI on Proxmox is fine for some things and others not so much. I love having the ability to simply run a script and have and hour's worth of work done in seconds without having to remember what video I learned it on or where I saved my notes the last time I did it or if I even made notes.

The two commands below will get you where you need to be for this stage of the server setup and prepare you to add useful components to your server with well-defined scripts to produce consistent results.

Replace your_username with your username and your_server_ip with your server's IP address or FQDN.

### Use `scp` to copy the script to your Proxmox server:
```shell
scp your_installer.sh your_username@your_server_ip:~/your_installer.sh
```
my local install looks like this
```shell
scp terraform_install.sh root@192.168.1.101:~/terraform_install.sh
```

### SSH into your Proxmox server and execute the script:
```shell
ssh your_username@your_server_ip "bash ~/your_installer.sh"
```
my local 
```shell    
ssh root@192.168.1.101 "bash ~/terraform_install.sh"
```