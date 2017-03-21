FROM fedora:25

MAINTAINER "Petr Hracek" <phracek@redhat.com>

LABEL summary="Provides a minimal set of packages used for debugging."
LABEL description="The Fedora Debugging Tools Container is a docker-formatted image that includes a minimal set of tools for troubleshooting and investigating a Fedora Host. Designed to run as a privileged container."
LABEL io.k8s.display-name="Fedora Debugging Tools Base"

RUN dnf install -y --setopt=tsflags=nodocs \
    iputils \
    iproute \
    lsof \
    net-tools \
    passwd \
    strace \
    valgrind && \
    dnf -y clean all

CMD ["/usr/bin/bash"]
