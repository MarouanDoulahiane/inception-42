FROM debian:bullseye

RUN apt-get update && apt-get install -y \
    wget

RUN mkdir workspace

WORKDIR /workspace

COPY tools/wp-install.sh .

CMD ["bash", "wp-install.sh"]
