FROM ubuntu:22.04

# Install systemd, docker, tmate, tools
RUN apt-get update && apt-get install -y \
    systemd systemd-sysv docker.io tmate sudo curl wget iproute2 \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# Add start.sh
COPY start.sh /start.sh
RUN chmod +x /start.sh

# Attempt to run systemd + docker
CMD ["/start.sh"]
