# debugging-tools-base
A minimal set of debugging tools so I can troubleshoot my running server.

The list of packages available in container is:

 * iproute -  Advanced IP routing and network device configuration tools
 * iputils - Network monitoring tools including ping
 * lsof - A utility which lists open files on a Linux/UNIX system
 * net-tools - Basic networking tools
 * passwd - An utility for setting or changing passwords using PAM - YES (no if we're not making container)
 * strace - Tracks and displays system calls associated with a running process
 * valgrind - Tool for finding memory management bugs in programs


## How to run the container for debugging

Pull container from DockerHub:

```bash
docker pull modularitycontainers/debugging-tools-base
```

For running the container, use command:

```bash
docker run -it --name NAME --privileged --ipc=host --net=host --pid=host -e HOST=/host -e NAME=NAME -e IMAGE=IMAGE -v /run:/run -v /var/log:/var/log -v /etc/machine-id:/etc/machine-id -v /etc/localtime:/etc/localtime -v /:/host debugging-tools-base
```


## How to extent the container with you set of tools for debugging

Write a Dockerfile:

```bash
FROM modularitycontainer/debugging-tool-base:latest

MAINTAINTER YOUR_NAME <email@adress.com>

RUN INSTALL_PKSG="<list of your tools for debugging> " && \
    dnf install -y --setopt=tsflags=nodocs $INSTALL_PKGS && \
    dnf -y clean all
CMD ["/usr/bin/bash"]

```