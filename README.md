# Docker Development Environment

## 프로젝트 소개
이 프로젝트는 32비트 C 프로그램 개발을 위한 Docker 기반 개발 환경을 제공합니다.

## 프로젝트 구조
```
.
├── Dockerfile         # linux/amd64 Ubuntu:22.04 기반 개발 환경
├── README.md         
└── wrk/              # 프로젝트 작업 디렉토리
    ├── Makefile      # C 프로그램 빌드 설정 (-m32 플래그 포함)
    └── main.c        # 메인 C 소스 코드
```

## 요구사항
- Docker (version 20 이상)
- Git

## 시작하기

1. 프로젝트 클론:
```bash
git clone https://github.com/SNU-RTOS/docker-test
cd docker-test
```

2. Docker 개발 환경 실행:
```bash
# Linux/MacOS
docker run -it -v ./wrk:/app snurtos/eos

# Windows
docker run -it -v .\wrk:/app snurtos/eos
```

원하는 툴을 사용해서 wrk 디렉토리 내의 코드를 수정한 뒤

Docker 컨테이너 내부에서:
- `make` 명령어로 빌드
- `./main` 명령어로 실행

## Docker 명령어 설명

`docker run -it -v ./wrk:/app snurtos/eos`의 각 옵션 설명:
- `-it`: 대화형 터미널 제공
- `-v ./wrk:/app`: 현재 디렉토리의 wrk 폴더를 컨테이너의 /app에 마운트
  - 호스트의 코드를 실시간으로 수정 가능
  - 변경사항이 즉시 컨테이너에 반영
- `snurtos/eos`: 미리 구성된 개발 환경 이미지