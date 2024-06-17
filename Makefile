NAME = Inception
BLUE		= ${shell tput setaf 4}
BOLD		= ${shell tput bold}
ORANGE		= ${shell tput setaf 202}
NO_COLOR	= ${shell tput sgr0}

all: banner
	@printf "\n ${BOLD}🏃 Running configuration for ${NAME}${NO_COLOR}\n"
	@docker-compose -f ./srcs/docker-compose.yml --env-file srcs/.env up -d

build: banner
	@printf "\n ${BOLD}🛠️ Building configuration for ${NAME}${NO_COLOR}\n"
	@docker-compose -f ./srcs/docker-compose.yml --env-file srcs/.env up -d --build

down:
	@printf "\n ${BOLD}🔌 Stopping configuration for ${NAME}${NO_COLOR}\n"
	@docker-compose -f ./srcs/docker-compose.yml --env-file srcs/.env down --rmi all

clean:
	@printf "\n ${BOLD}🧹 Cleaning configuration ${NO_COLOR}\n"
	@docker system prune -a

fclean:
	@printf "\n ${BOLD}🔥 Burn it to the ground ${NO_COLOR}\n"
	@docker system prune --all --force --volumes
	@docker network prune --force
	@docker volume prune --force

re: clean build

.PHONY: all build clean fclean re

banner:
	${info ${BLUE}${BOLD}         .}
	${info ${}        ":"}
	${info ${}      ___:____     |"\/"|}
	${info ${}    ,'        `.    \  /}
	${info ${}    |  ^        \___/  |}
	${info ~^~^~^~^~^~^~^~^~^~^~^~^~^~^~}
	${info ${ORANGE} 🌊 We need to go deeper! 🌊${NO_COLOR}  }
