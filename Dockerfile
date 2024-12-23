FROM golang:latest

User root
# 기본 패키지 설치
RUN apt-get update && apt-get install -y \
    python3 \
    python3-pip \
    wget \
    curl \
    sudo \
    git \
    gnome-keyring \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

# code-server 설치
RUN curl -fsSL https://code-server.dev/install.sh | sh

# 작업 디렉토리 설정
WORKDIR /goPrj
ENV PATH="/usr/bin/code-server:${PATH}"
# code-server 포트 노출
EXPOSE 8080

# 환경변수 설정
ENV TZ=Asia/Seoul

# code-server 실행
ENTRYPOINT ["code-server", "--bind-addr", "0.0.0.0:8080", "--auth", "none"]
