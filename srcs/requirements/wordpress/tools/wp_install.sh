#!/bin/sh

wp core install --url=$WORDPRESS_URL --title=Inception --admin_user=$WORDPRESS_ADMIN_USER --admin_password=$WORDPRESS_ADMIN_PASSWORD --admin_email=$WORDPRESS_ADMIN_EMAIL --allow-root
wp user create $WORDPRESS_GUEST_USER $WORDPRESS_GUEST_EMAIL --role=author --user_pass=$WORDPRESS_GUEST_PASSWORD --allow-root
wp plugin update --all --allow-root

ln -s $(find /usr/sbin -name 'php-fpm*') /usr/bin/php-fpm

exec php-fpm -F