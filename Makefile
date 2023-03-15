all: up

build: 
	@docker-compose -f ./srcs/docker-compose.yml build

stop:
	@docker-compose -f ./srcs/docker-compose.yml stop

down:
	@docker-compose -f ./srcs/docker-compose.yml down
	sudo rm -rf /home/dohyulee/data/*

up:
	mkdir -p /home/dohyulee/data/mariadb
	mkdir -p /home/dohyulee/data/wordpress
	@docker-compose -f ./srcs/docker-compose.yml up -d

fclean: down
	docker stop $$(docker ps -qa);					\
	docker rm $$(docker ps -qa);					\
	docker rmi -f $$(docker images -qa);			\
	docker volume rm $$(docker volume ls -q);		\
	docker network rm $$(docker network ls -q) 2> /dev/null

clean: stop

re : down all

logs:
	docker-compose -f ./srcs/docker-compose.yml logs -f

.PHONY: up stop build down fclean clean all