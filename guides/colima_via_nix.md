### Running Docker without Docker Desktop on macOS
Feb 1, 2022 | 3 min read | Docker, macOS, Nix, Colima, Bash

Today is the day, Docker Desktop is no longer free for commercial use inside larger companies. This includes Bekk. Commercial licenses are not that expensive, but I wanted to see how my Docker use-cases on macOS could be solved in different ways before splashing the cash. Right now I use Docker for running tools with docker run and some more complex workflows with docker compose.

The experiment was a success during my limited testing, and in the following I’ll detail what I did to run my containers using Colima.

### tl;dr
Uninstall Docker Desktop
Install packages for docker and docker compose (if needed) using your favorite macOS package manager
Install colima to use as container runtime
Run your Docker workflow successfully without Docker Desktop

### Install Nix Package Manager
Previously I’ve used Homebrew as my package manager of choice on macOS, but lately my colleagues have been touting the merits of the Nix Package Manager, citing promising properties such reproducibility, declarativeness and reliability.

Nix builds packages in isolation from each other. Thus each packages has its own version of each dependency, even if other packages already has the same dependency. This ensures that they are reproducible and don’t have undeclared dependencies, so if a package works on one machine, it will also work on another. No more versioning conflicts, good stuff 🥳

To install Nix in the recommended fashion (multiple users), just run:
```
sh <(curl -L https://nixos.org/nix/install) --daemon
```

Then wait for it to finish and restart your shell.

### Install Docker and Docker Compose
A list of supported Nix packages can be found at their package registry, with over 80 000 to chose from at the time of writing. A search for Docker yields the expected results and Docker can be installed using:
```
nix-env -iA nixpkgs.docker
```

Docker Compose is just as easy:
```
nix-env -iA nixpkgs.docker-compose
```

### Install Colima
Then finally Colima, containers in Lima, Linux virtual machines (on macOS). 
Visit Colima on Github.com
https://github.com/abiosoft/colima

Install through Nix with:
```
nix-env -iA nixpkgs.colima
```

After Colima is installed, it needs to be started before we can run our docker commands:
```
$ colima start

INFO[0000] using docker runtime                         
INFO[0000] starting colima                              
INFO[0000] starting ...                                  context=vm
INFO[0020] provisioning ...                              context=docker
INFO[0020] starting ...                                  context=docker
INFO[0025] waiting for startup to complete ...           context=docker
INFO[0026] done    
```

### Use Docker as normal
That’s it! From here on out it’s smooth sailing, flowery fields and butterflies. The setup works, at least for docker run and docker compose.

For instance this command works, which runs a Markdown linter on markdown files:
```
docker run --rm -v "$PWD:/usr/src/app/files:delegated" andmos/markdownlint **/*.md
```
Or you can try the classic Docker first command:
```
docker run hello-world
```

Perfect for blogs such as this one!

But on a final note, consider supporting the developer tools which makes our lives easier. Nix and Colima takes donations, and since every company needs funding and Docker has been free for so long, Docker Desktop deserves some pay-back too. This experiment has been educational, but I see an expense report or two in my immediate future.