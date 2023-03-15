NAME = inception

all		:	$(NAME)

$(NAME)	:
	@sudo mkdir -p /home/dohyulee/data/mariadb/
	@sudo mkdir -p /home/dohyulee/data/wordpress/
	@sudo docker-compose -f ./srcs/docker-compose.yml up --build -d

up		:
	@sudo docker-compose -f ./srcs/docker-compose.yml up -d

down	:
	@sudo docker-compose -f ./srcs/docker-compose.yml down

clean	:
	@sudo docker-compose -f ./srcs/docker-compose.yml down --rmi all --volumes


fclean	: clean
	@sudo rm -rf /home/dohyulee/data

re	: fclean all

cc:
	docker stop $$(docker ps -qa);					\
	docker rm $$(docker ps -qa);					\
	docker rmi -f $$(docker images -qa);			\
	docker volume rm $$(docker volume ls -q);		\
	docker network rm $$(docker network ls -q);		\
	sudo rm -rf /home/dohyulee/data

.PHONY	: all down clean fclean re
