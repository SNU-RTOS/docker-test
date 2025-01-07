#!/bin/bash

# Docker 설치 여부 확인
if ! command -v docker &> /dev/null; then
    echo "Error: Docker가 설치되어 있지 않습니다."
    echo "아래 링크를 참고하여 Docker를 설치해주세요:"
    echo "- Windows: https://docs.docker.com/desktop/install/windows-install/"
    echo "- Mac: https://docs.docker.com/desktop/install/mac-install/"
    echo "- Linux: https://docs.docker.com/engine/install/"
    exit 1
fi

# Docker 데몬 실행 여부 확인
if ! docker info &> /dev/null; then
    echo "Error: Docker 데몬이 실행되고 있지 않습니다."
    if [[ "$OSTYPE" == "linux-gnu"* ]]; then
        echo "다음 명령어로 Docker를 시작할 수 있습니다:"
        echo "  sudo systemctl start docker"
    elif [[ "$OSTYPE" == "darwin"* ]] || [[ "$OSTYPE" == "msys"* ]]; then
        echo "Docker Desktop을 실행해주세요."
    fi
    exit 1
fi

# 현재 디렉토리 확인
if [ ! -d "wrk" ]; then
    echo "Error: wrk 디렉토리를 찾을 수 없습니다."
    exit 1
fi

# Makefile과 main.c 파일 존재 확인
if [ ! -f "wrk/Makefile" ] || [ ! -f "wrk/main.c" ]; then
    echo "Error: wrk 디렉토리 안에 필요한 파일이 없습니다."
    exit 1
fi

IMAGE_NAME="docker-hello-world"

echo "빌드를 시작합니다..."
docker build -t $IMAGE_NAME -f Dockerfile .

if [ $? -eq 0 ]; then
    echo "빌드가 완료되었습니다. 다음 명령어로 실행해보세요:"
    echo "docker run $IMAGE_NAME"
else
    echo "빌드 중 오류가 발생했습니다."
    exit 1
fi