#!/bin/bash

wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

chmod +x wp-cli.phar

mv wp-cli.phar /usr/local/bin/wp

chmod 777 /var/www/html

chmod 777 /var/www/

cd /var/www/html

su www-data -s /bin/bash -c "
    cd /var/www/html
    wp core download
    wp core config --dbname=$MYSQL_DATABASE --dbuser=$MYSQL_USER --dbpass=$MYSQL_PASSWORD --dbhost=$WORDPRESS_DB_HOST
    wp config set WP_REDIS_HOST $REDIS_HOST
    wp config set WP_REDIS_PORT $REDIS_PORT
    wp core install --url=$DOMAIN_NAME --title=$DOMAIN_NAME --admin_user=$WP_ADMIN_USER --admin_password=$WP_ADMIN_PASSWORD --admin_email=$WP_ADMIN_EMAIL
    wp user create $WP_USER $WP_EMAIL --role=author --user_pass=$WP_PASSWORD
    wp plugin install redis-cache --activate
    wp redis enable

"

exec php-fpm7.4 -F