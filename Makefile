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

.PHONY	: all down clean fclean re
