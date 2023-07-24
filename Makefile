LOGIN			:= mtomomit
COMPOSE			:= srcs/docker-compose.yml
VOLUMES_PATH	:= /home/$(LOGIN)/data

all: setup up

up:
	docker-compose -f $(COMPOSE) up --build --detach

down:
	docker-compose -f $(COMPOSE) down

fclean: down
	docker system prune --all --force --volumes
	sudo rm -rf /home/$(LOGIN)/data

setup:
	sudo mkdir -p $(VOLUMES_PATH)/wordpress
	sudo mkdir -p $(VOLUMES_PATH)/mariadb
	grep $(LOGIN).42.fr /etc/hosts || echo "127.0.0.1 $(LOGIN).42.fr" >> /etc/hosts