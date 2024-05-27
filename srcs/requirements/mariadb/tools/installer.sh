#!/bin/bash

touch init.sql

echo "CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE;" >> init.sql

echo "CREATE USER IF NOT EXISTS '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';" >> init.sql

echo "GRANT ALL PRIVILEGES ON $MYSQL_DATABASE.* TO '$MYSQL_USER'@'%';" >> init.sql

echo "FLUSH PRIVILEGES;" >> init.sql

mkdir -p /run/mysqld

mv init.sql /etc/mysql/init.sql

exec "mysqld"
