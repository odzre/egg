FROM ubuntu:24.04

LABEL author="XMPanels" maintainer="admin@xmpanels.com"

# Bypass interactive prompts during installation
ENV DEBIAN_FRONTEND=noninteractive
ENV TZ=Asia/Jakarta

# Install dependencies and tools requested
RUN apt-get update -y && \
    apt-get install -y curl ca-certificates openssl git tar sqlite3 fontconfig tzdata iproute2 jq bc \
    python3 python3-pip golang redis-tools mariadb-client chromium-browser ffmpeg wget sudo && \
    # Install Node.js 20.x
    curl -fsSL https://deb.nodesource.com/setup_20.x | bash - && \
    apt-get install -y nodejs && \
    # Install Bun
    npm install -g bun && \
    # Install yt-dlp
    wget https://github.com/yt-dlp/yt-dlp/releases/latest/download/yt-dlp -O /usr/local/bin/yt-dlp && \
    chmod a+rx /usr/local/bin/yt-dlp && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Add container user
RUN useradd -m -d /home/container -s /bin/bash container

# Give container user access to entrypoint (copied later)
ENV USER=container HOME=/home/container
WORKDIR /home/container

# Copy entrypoint script
COPY ./entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# Switch to container user
USER container

# Run entrypoint
CMD ["/bin/bash", "/entrypoint.sh"]
