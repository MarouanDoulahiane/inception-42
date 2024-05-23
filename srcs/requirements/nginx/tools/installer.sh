#!/bin/bash

mkdir -p /root/certs && cd /root/certs

openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout nginx-selfsigned.key -out nginx-selfsigned.crt -subj "/C=RU/ST=Moscow/L=Moscow/O=21school/OU=21/CN=$DOMAIN_NAME"


chmod 600 nginx-selfsigned.key

chmod 600 nginx-selfsigned.crt

exec "nginx" "-g" "daemon off;"