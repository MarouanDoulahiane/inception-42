FROM debian:bullseye


# Update package lists and install necessary packages
RUN apt-get update && apt-get install php -y && apt-get install php7.4-fpm php-mysqli  wget -y  && service php7.4-fpm start 

# Create workspace directory
RUN mkdir /workspace

# Set working directory
WORKDIR /workspace

COPY ./conf/www.conf /etc/php/7.4/fpm/pool.d/.

# Copy installer script
COPY ./tools/installer.sh .


RUN echo "<?php phpinfo(); ?>" > /workspace/index.php

RUN mv /workspace/index.php /var/www/html/index.php

# Make installer script executable
RUN chmod +x installer.sh

# Define the default command to run the installer script
CMD ["./installer.sh"]

# CMD ["php-fpm7.4", "-F"]
