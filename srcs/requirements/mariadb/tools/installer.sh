#!/bin/bash


# mariadb -u root -p$MYSQL_ROOT_PASSWORD -e "CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE;"
# mariadb -u root -p$MYSQL_ROOT_PASSWORD -e "CREATE USER IF NOT EXISTS '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';"
# mariadb -u root -p$MYSQL_ROOT_PASSWORD -e "GRANT ALL PRIVILEGES ON $MYSQL_DATABASE.* TO '$MYSQL_USER'@'%';"
# mariadb -u root -p$MYSQL_ROOT_PASSWORD -e "FLUSH PRIVILEGES;"

touch init.sql

echo "CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE;" >> init.sql

echo "CREATE USER IF NOT EXISTS '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';" >> init.sql

echo "GRANT ALL PRIVILEGES ON $MYSQL_DATABASE.* TO '$MYSQL_USER'@'%';" >> init.sql

echo "FLUSH PRIVILEGES;" >> init.sql

mkdir -p /run/mysqld

mv init.sql /etc/mysql/init.sql

echo "MariaDB is ready to use!"

exec "mysqld"
