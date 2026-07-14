FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get install -y \
    bash \
    netcat-openbsd \
    cowsay \
    fortune-mod \
    dos2unix && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

ENV PATH="/usr/games:$PATH"

WORKDIR /app

COPY wisecow.sh .

RUN dos2unix wisecow.sh && \
    chmod +x wisecow.sh

EXPOSE 4499

CMD ["bash", "/app/wisecow.sh"]