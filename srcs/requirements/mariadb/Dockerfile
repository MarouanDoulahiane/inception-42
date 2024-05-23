FROM debian:bullseye

RUN apt-get update && apt-get install -y mariadb-server mariadb-client

RUN mkdir workspace

WORKDIR /workspace

COPY ./tools/installer.sh .

COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

RUN chmod +x installer.sh

CMD ["./installer.sh"]
