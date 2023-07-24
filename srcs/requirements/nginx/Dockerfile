FROM debian:11

RUN apt update -y && apt upgrade -y && \
	apt install nginx -y && apt install openssl -y

RUN openssl req -batch -x509 -sha256 -nodes -newkey rsa:2048 -days 365 \
	-keyout /etc/ssl/private/mtomomit.key \
	-out /etc/ssl/certs/mtomomit.crt

COPY ./conf/nginx.conf /etc/nginx/conf.d

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]
