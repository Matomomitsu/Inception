FROM debian:11

ARG MYSQL_DATABASE
ARG MYSQL_USER
ARG MYSQL_PASSWORD
ARG MYSQL_HOST

WORKDIR /var/www/html/

RUN apt update -y && apt upgrade -y && apt install -y \
	php-fpm \
	php-mysql \
	mariadb-client \
	wget

RUN sed -i.default "/^listen\s=.*/c\listen = 0.0.0.0:9000" \
	/etc/php/[0-9]*.[0-9]*/fpm/pool.d/www.conf

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
    && chmod +x wp-cli.phar \
    && mv wp-cli.phar /usr/local/bin/wp

COPY ./tools/wp_install.sh /tmp/wp_install.sh

RUN wp core download --path=/var/www/html --force --allow-root

RUN cp wp-config-sample.php wp-config.php && \
	sed -i "s/database_name_here/$MYSQL_DATABASE/g" wp-config.php && \
	sed -i "s/username_here/$MYSQL_USER/g" wp-config.php && \
	sed -i "s/password_here/$MYSQL_PASSWORD/g" wp-config.php && \
	sed -i "s/localhost/$MYSQL_HOST/g" wp-config.php


RUN mkdir -p /run/php

CMD ["sh", "/tmp/wp_install.sh"]