## Overview

Building upon the Submissions [Pilot 2](https://github.com/RConsortium/submissions-pilot2) in which a Shiny application created as an R package was successfully transferred to the FDA using the eCTD gateway protocol, the objective of Pilot 4 is to explore novel technologies to bundle the application along with the necessary execution dependencies and streamline the transfer and execution procedures. The specific technologies targeted in this pilot are the following:

* __Containers__: A mechanism to encapsulate a piece of software alongside the environment used for its dependencies and execution. The end user simply needs a container runtime installed on their system to execute a container.
* __WebAssembly__: A framework inspired by assembly in which applications developed in languages such as JavaScript, Python, and now R can be compiled into a self-contained native bundle that can be executed directly in a user's modern web browser, without requiring additional software on their host system.

This repository addresses the **container** version of the application.

## Important Links

TBD

## Development Setup

### How to Clone Repository

This repository leverages the concept of [Git Submodules](https://www.atlassian.com/git/tutorials/git-submodule) to dynamically obtain the Pilot 2 Shiny Application source code. To ensure your local clone of the repository obtains the submodule, run the following commands in Git, depending on which method you prefer:

```
# HTTP method
git clone --recurse-submodules https://github.com/RConsortium/submissions-pilot4-container

# SSH method
git clone --recurse-submodules git@github.com:RConsortium/submissions-pilot4-container.git
```

For reference, the submodule was initialized with the following:

```
git submodule add git@github.com:RConsortium/submissions-pilot2.git submissions-pilot2
```

### Container Runtime

This pilot uses the [Docker](https://www.docker.com/) containerization engine to create and execute the Shiny application used in Pilot 2 as a container. There are multiple ways to use Docker on your system:

* [Docker Desktop](https://www.docker.com/products/docker-desktop/) provides a GUI interface to manage containers and associated images. The utility is available on all operating systems: Windows (Intel and ARM), MacOS (Intel and Arm), and Linux.
* Specific to Linux, you can install [Docker Engine](https://docs.docker.com/engine/install/), also known as Docker Community Edition. Complete details on supported Linux distributions and installation procedures can be found in the aforementioned link.

### Building Application Container

Navigate to the root directory of the repository on your system, and run the following command:

```
docker build -t RConsortium/submissions-pilot4-container:latest .
```

### Running Application Container

Run the following command in a terminal:

```
docker run -it --rm -p 8787:8787 RConsortium/submissions-pilot4-container:latest
```

Next, open a new browser tab and visit the following address: `localhost:8787`. You should see the Pilot 2 application appear in the browser tab.

Additional notes:

* If you prefer to use a different port on your host system to serve the application, you can change the first port number in the `-p 8787:8787` flag of the run command. For example, if you wish to use the port number `7777` on your host system, the run command would be the following:

```
docker run -it --rm -p 7777:8787 RConsortium/submissions-pilot4-container:latest
```

### Assembling eCTD Bundle

TBD

### Automation 

TBD

### Acknowledgement

The instrascture to create and execute the container version of the Shiny application was initially developed by the engineers at [Appsilon](https://www.appsilon.com/) and documented in the following GitHub repository: [github.com/Appsilon/experimental-fda-submission-4-podman](https://github.com/Appsilon/experimental-fda-submission-4-podman).