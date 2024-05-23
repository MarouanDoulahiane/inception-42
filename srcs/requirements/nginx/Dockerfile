FROM debian:bullseye

RUN apt-get update && apt-get install nginx openssl -y

COPY ./conf/default /etc/nginx/sites-available/default

RUN mkdir /workspace

WORKDIR /workspace

COPY ./tools/installer.sh .

RUN chmod +x installer.sh

CMD ["./installer.sh"]