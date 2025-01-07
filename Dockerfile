FROM --platform=linux/amd64 ubuntu:22.04

# 필요한 개발 도구 설치
RUN apt-get update && \
    apt-get install -y gcc make gcc-multilib g++-multilib \
    gdb && \
    dpkg --add-architecture i386 && \
    apt-get update && \
    apt-get install -y libc6:i386 && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /app

CMD ["/bin/bash"]