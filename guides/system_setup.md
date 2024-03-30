You might need to access a number of different docs/guides/websites along the way to success with this project and so I've included those most relevant links here for easy access and so you don't have to leave all of them open in your browser while working your way to a functioning dev environment.

Ansible Docs
https://docs.ansible.com/

Colima Docs
https://github.com/abiosoft/colima/tree/main

Docker Docs
https://docs.docker.com/get-started/overview/

Nix Docs
https://nixos.org/manual/nix/stable/introduction

Terraform Docs
https://developer.hashicorp.com/terraform

Proxmox VE Docs
https://pve.proxmox.com/pve-docs/index.html



******************************************************************************

Red Hat Ansible Automation Platform
https://www.redhat.com/en/technologies/management/ansible?extIdCarryOver=true&sc_cid=701f2000001OH7YAAW

The Ansible Book; Ansible as a Docker Container
https://hackmd.io/@the-ansible-book/B1y5tXers

ZSH Z-Shell
https://zsh.sourceforge.io/Guide/zshguide.html

Setting $PATH for zsh on macOS
https://gist.github.com/Linerre/f11ad4a6a934dcf01ee8415c9457e7b2



This document describes the steps required to setup a local dev environment using the Package Manager Nix, (versus Homebrew) Docker, and Docker Compose runtimes supported by Colima versus Docker Desktop or other options. I'm working on a Mac so this guidance can reasonably be expected to work on Macs, Linux, and other Unix types. Windows will require it's own guide.

The overall project that I am working on is to get my local environment in a situation to run Docker with a minimal code footprint on my local system, requiring the least amount of resources to run.

The goal is to set up a Docker environment in which to run Ansible to administer local servers on my network initially. Later allowing for playbooks that can assist in provisioning and maintaining state in small business networks as a professional matter. Whether the professional activities are carried out on-site or remote is yet to be determined but is ultimately not of primary concern.

An excellent and clarifying article about the differences and different use cases for Ansible vs
Terraform can be found here: https://www.ansible.com/blog/ansible-vs.-terraform-demystified

The basic outline is as follows:
1. Install the package manager Nix
2. Install Docker
3. Install Docker Compose
4. Install Colima
5. Run docker-compose file to build the Ansible environment

So let's get started...

It should be noted that the install command below is for MacOS installations.
Please see https://nixos.org/download for more OS install options.
That being said, everything in this guide is related to working on MacOS.

Let's go!

# Install Nix
```shell
sh <(curl -L https://nixos.org/nix/install) --daemon
```
# Install Docker via Nix
```shell
nix-env -iA nixpkgs.docker
```
# Install Docker Compose via Nix
```shell
nix-env -iA nixpkgs.docker-compose
```
# Install Colima via Nix
```shell
nix-env -iA nixpkgs.colima
```
# Start Colima runtime
```shell
colima start
```
# Test the Docker install using Docker run
This should pull docker image of hello-world (if not already pulled)
```shell
docker run hello-world
```
and output below on the terminal:
```output
Hello from Docker
```
This message shows that your installation appears to be working correctly.

To generate this message, Docker took the following steps:
1. The Docker client contacted the Docker daemon.
2. The Docker daemon pulled the "hello-world" image from the Docker Hub.(arm64v8)
3. The Docker daemon created a new container from that image which runs the
   executable that produces the output you are currently reading.
4. The Docker daemon streamed that output to the Docker client, which sent it
   to your terminal.

Try something more ambitious! 
You can spin up an Ubuntu container with:
```shell
docker run -it ubuntu bash
```
Share images, automate workflows, and more with a free Docker ID:
https://hub.docker.com/

For more examples and ideas, visit:
https://docs.docker.com/get-started/!

# Check Docker for proper function
```shell
docker ps
```

# Potential issues when starting Colima
```shell
colima start
INFO[0003] starting colima                              
INFO[0003] runtime: docker                              
INFO[0006] preparing network ...                         context=vm
WARN[0007] error setting up network dependencies: error at 'preparing network': error running [/Users/carlos/.nix-profile/bin/colima daemon start default --gvproxy], output: "time=\"2023-10-10T16:49:54-10:00\" level=fatal msg=\"error starting daemon: open /Users/carlos/.colima/default/daemon/daemon.pid: permission denied\"", err: "exit status 1"  context=vm
INFO[0010] starting ...                                  context=vm
> Using the existing instance "colima"
> errors inspecting instance: [failed to get Info from "/Users/carlos/.lima/colima/ha.sock": Get "http://lima-hostagent/v1/info": context deadline exceeded]
FATA[0013] error starting vm: error at 'starting': exit status 1
```

# See info about solving this error at the following URL
https://github.com/abiosoft/colima/blob/main/docs/FAQ.md#fata0000-error-starting-vm-error-at-starting-exit-status-1

FATA[0000] error starting vm: error at 'starting': exit status 1
This indicates that a fatal error is preventing Colima from starting, you can enable the debug log with --verbose flag to get more info.

If the log output includes exiting, status={Running:false Degraded:false Exiting:true Errors:[] SSHLocalPort:0} then it is most certainly due to one of the following.

Running on a device without virtualization support.
Running an x86_64 version of homebrew (and Colima) on an M1 device.
Issues after an upgrade
The recommended way to troubleshoot after an upgrade is to test with a separate profile.

# start with a profile named 'debug'
```shell
colima start debug
```
If the separate profile starts successfully without issues, then the issue would be resolved by resetting the default profile.

```shell
colima delete
colima start
```

> Using the existing instance "colima-debug"
> "QEMU binary \"/Users/carlos/.colima/_wrapper/71d044197730a052d674b9bd189cc4df8742db80/bin/qemu-system-x86_64\" is not properly signed with the \"com.apple.security.hypervisor\" entitlement" error="failed to run [codesign --verify /Users/carlos/.colima/_wrapper/71d044197730a052d674b9bd189cc4df8742db80/bin/qemu-system-x86_64]: exit status 1 (out=\"/Users/carlos/.colima/_wrapper/71d044197730a052d674b9bd189cc4df8742db80/bin/qemu-system-x86_64: code object is not signed at all\\nIn architecture: x86_64\\n\")"
> You have to sign the QEMU binary with the "com.apple.security.hypervisor" entitlement manually. See https://github.com/lima-vm/lima/issues/1742 .
> [hostagent] Starting QEMU (hint: to watch the boot progress, see "/Users/carlos/.lima/colima-debug/serial*.log")
> SSH Local Port: 52408
> [hostagent] Waiting for the essential requirement 1 of 5: "ssh"...