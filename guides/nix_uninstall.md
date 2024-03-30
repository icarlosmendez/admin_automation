

# This is a guide based on the Nix install script.
```shell
bash <(curl -L https://nixos.org/nix/install) --daemon
```

As Nix prepares for an install, it goes through a series of steps 
to insure there is no current or previous installation of Nix on the system.

If it detects a previous install, it will ask permission to perform a number of steps
to uninstall the old installation and clean up a number of files that need to be
cleared of any signs of Nix before proceeding with the install.

Since you likely know there is/was an install of Nix on your system, you can simply do this
yourself and save all the drama of working with the Nix script as it ultimately leaves
you with things to do manually anyway, so we might as well just do the whole thing.

I didn't write any of the scripted code, but I did add some supporting comments.


# Perform a manual uninstall of Nix. 
This includes all the steps the interactive script guides you through and everything it recommends you do at the end. This guide though is based directly off the uninstall instructions from nixos.org

During install, 'nix' is added to /etc/synthetic.conf, which instructs
macOS to create an empty root directory for mounting the Nix volume.
# 1. Remove /etc/synthetic.conf:
```shell
sudo rm /etc/synthetic.conf
```

During install, '/nix' is added to /etc/fstab so that macOS knows what
mount options to use for the Nix volume.
# 2. Remove /etc/fstab:
```shell
sudo rm /etc/fstab
```


The installer adds a LaunchDaemon to mount your Nix volume: org.nixos.darwin-store
# 3. Terminate the daemon:
```shell
sudo launchctl bootout system/org.nixos.darwin-store
```

# 4. Remove the daemon definition:
```shell
sudo rm /Library/LaunchDaemons/org.nixos.darwin-store.plist
```

# 5. Remove macOS-specific components:
Uninstall LaunchDaemon org.nixos.nix-daemon  
```shell
sudo launchctl bootout system/org.nixos.nix-daemon
```

# 6. Remove the preferences list:
```shell
sudo rm /Library/LaunchDaemons/org.nixos.nix-daemon.plist
```

~~> Check for artifacts of previous installs
# 7. Ensure /etc/bashrc.backup-before-nix does not have anything Nix-related in it.
```shell
cat /etc/bashrc.backup-before-nix
```
Feel free to compare the contents to /etc/bashrc.
Once your comfortable that the backup file looks like you would expect the original to look
meaning it is free of Nix-related content, you can proceed with the next step.


# 8. Restore /etc/bashrc.backup-before-nix back to /etc/bashrc
```shell
sudo mv /etc/bashrc.backup-before-nix /etc/bashrc
```
(after this one, you may need to re-open any terminals that were opened while it existed.)


~~> Check for artifacts of previous installs
# 9. Ensure /etc/zshrc.backup-before-nix does not have anything Nix-related in it.
```shell
cat /etc/zshrc.backup-before-nix
```
Feel free to compare the contents to /etc/zshrc.
Once your comfortable that the backup file looks like you would expect the original to look
meaning it is free of Nix-related content, you can proceed with the next step.

# 10. Restore /etc/zshrc.backup-before-nix back to /etc/zshrc
```shell
sudo mv /etc/zshrc.backup-before-nix /etc/zshrc
```
(after this one, you may need to re-open any terminals that were opened while it existed.)


# 11. Delete the files Nix added to your system:
```shell
sudo rm -rf "/etc/nix" "/nix" "/var/root/.nix-profile" "/var/root/.nix-defexpr" "/var/root/.nix-channels" "/var/root/.local/state/nix" "/var/root/.cache/nix" "/Users/your-username/.nix-profile" "/Users/your-username/.nix-defexpr" "/Users/your-username/.nix-channels" "/Users/your-username/.local/state/nix" "/Users/your-username/.cache/nix"
```

I encountered one interesting anomaly that I was unable to resolve satisfactorily 
and that was that when I tried to remove /nix, it consistently reported "Resource busy"
I don't know where to go with that as that should really just be a directory
and we already removed the daemon from the system, so...?

I found that some of the other files in the above command simply didn't exist on my machine 
but I attempted to remove them anyway just to be thorough, and I didn't encounter any errors.

And that is it.


NixOS guys would love to help if you need it.

You can open an issue at
https://github.com/NixOS/nix/issues/new?labels=installer&template=installer.md

Or get in touch with the community: https://nixos.org/community


# Sample output from the end of the Nix installation

---- sudo execution ------------------------------------------------------------
I am executing:

    $ sudo launchctl kickstart -k system/org.nixos.nix-daemon

to start the nix-daemon

Alright! We're done!
Try it! Open a new terminal, and type:

  $ nix-shell -p nix-info --run "nix-info -m"

Thank you for using this installer. If you have any feedback or need
help, don't hesitate:

You can open an issue at
https://github.com/NixOS/nix/issues/new?labels=installer&template=installer.md

Or get in touch with the community: https://nixos.org/community

---- Reminders -----------------------------------------------------------------
[ 1 ]
Nix won't work in active shell sessions until you restart them.

# Restart your shell session with the following commands

```shell
    $ source ~/.zshrc
```
```shell
    $ source ~/.bashrc
```