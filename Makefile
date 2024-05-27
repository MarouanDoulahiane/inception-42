all:
	@mkdir -p /home/mdoulahi/data/wordpress
	@mkdir -p /home/mdoulahi/data/mariadb
	@mkdir -p /home/mdoulahi/data/redis
	@docker-compose -f ./srcs/docker-compose.yml up -d --build

down:
	@docker-compose -f ./srcs/docker-compose.yml down

re: down all

.PHONY: all down re