# Base image for debian
FROM debian:11

ARG MYSQL_DATABASE
ARG MYSQL_USER
ARG MYSQL_PASSWORD

RUN apt update -y && apt upgrade -y && apt install mariadb-server -y

RUN mkdir -p /var/run/mysqld && \ 
     chown -R mysql:mysql /var/run/mysqld && \ 
     chmod 777 /var/run/mysqld

RUN echo "[mysqld] \n\
skip-networking=0 \n\
skip-bind-address" >> /etc/mysql/my.cnf

RUN service mariadb start && \
	mariadb -u root -e \
	"CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE; \
	CREATE USER '$MYSQL_USER'@'%' identified by '$MYSQL_PASSWORD'; \
	GRANT ALL ON $MYSQL_DATABASE.* TO '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD'; \
	FLUSH PRIVILEGES;" && \
	service mariadb stop

CMD ["mysqld_safe"]
