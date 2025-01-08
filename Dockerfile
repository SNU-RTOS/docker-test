FROM --platform=linux/amd64 ubuntu:22.04

# Installing necessary packages
RUN apt-get update && \
    apt-get install -y \
    gcc \
    make \
    gcc-multilib \
    g++-multilib \
    gdb \
    build-essential \
    sudo && \
    dpkg --add-architecture i386 && \
    apt-get update && \
    apt-get install -y libc6:i386 && \
    rm -rf /var/lib/apt/lists/*

# Create a new user and group with specific UID/GID from host
RUN groupadd -r studentgroup -g 1000 && \
    useradd -r -u 1000 -g 1000 -s /bin/bash -m -d /home/student -G sudo student

# Set up sudoers configuration safely
RUN mkdir -p /etc/sudoers.d && \
    echo "student ALL=(ALL) NOPASSWD: /usr/bin/make, /usr/bin/gdb" > /etc/sudoers.d/student && \
    chmod 0440 /etc/sudoers.d/student && \
    echo "includedir /etc/sudoers.d" >> /etc/sudoers

# Set up the working directory
WORKDIR /app

# Give appropriate permissions
RUN mkdir -p /app && \
    chown -R 1000:1000 /app && \
    chmod -R 775 /app

# Set the user
USER student

# Set the default command
CMD ["/bin/bash"]