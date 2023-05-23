NAME = inception
VERSION = 1.0.0

$(NAME): run

mariadb:
	@echo Building MariaDB Image...
	docker image build -t i-mariadb:${VERSION} ./srcs/mariadb

wordpress:
	@echo Building Wordpress Image...
	docker image build -t i-wordpress:${VERSION} ./srcs/wordpress

run: mariadb wordpress
	docker compose -f srcs/docker-compose.yml up

clean:
	docker image rm i-mariadb:${VERSION}
	docker image rm i-wordpress:${VERSION}