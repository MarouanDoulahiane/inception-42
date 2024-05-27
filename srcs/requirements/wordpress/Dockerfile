FROM debian:bullseye

RUN apt-get update && apt-get install php php7.4-fpm php-mysqli php-redis wget -y  && service php7.4-fpm start 

RUN mkdir /workspace

WORKDIR /workspace

COPY ./conf/www.conf /etc/php/7.4/fpm/pool.d/.

COPY ./tools/installer.sh .


RUN chmod +x installer.sh

CMD ["./installer.sh"]

