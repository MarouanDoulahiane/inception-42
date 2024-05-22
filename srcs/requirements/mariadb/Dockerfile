FROM debian:bullseye

RUN apt-get update && apt-get install -y mariadb-server mariadb-client

RUN mkdir workspace

WORKDIR /workspace

COPY ./tools/installer.sh .

RUN chmod +x installer.sh

CMD ["./installer.sh"]
