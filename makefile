# Docker compose version.
ifneq (,$(wildcard /usr/local/bin/docker-compose))
	DOCKER_COMPOSE := docker-compose
else
	DOCKER_COMPOSE := docker compose
endif


PROJECT_NAME = $(notdir $(PWD))
export PROJECT_NAME


# Functions 
.DEFAULT_GOAL := help

.PHONY: up-db up-app start check-db

start: ## Start the project.
	@echo
	@printf "\033[1;33m Iniciando o ${PROJECT_NAME}... ⌛⌛ \033[0m"
	@echo
	@$(MAKE) --no-print-directory up-app 
	@$(MAKE) --no-print-directory up-db 
	@printf "\033[1;42m\n${PROJECT_NAME} iniciado com sucesso. ✅  \033[0m"
	@echo
	@printf "\033[1;33m\nURL: \033[0m" && docker inspect --format='{{ (index (index .NetworkSettings.Ports "80/tcp") 0).HostPort }}' ${PROJECT_NAME}_nginx | xargs echo "http://${PROJECT_NAME}.localhost:" | sed 's/ //g'
	@$(MAKE) --no-print-directory check-db
	@echo

check-db: ## Check if the database is running.
	@if docker exec app_db mysqladmin ping -h localhost -u root -proot 2>/dev/null | grep -q "mysqld is alive"; then \
		printf "\033[1;42m\n${PROJECT_NAME}_db funcionando ✅ \033[0m\n" \
	else \
		printf "\033[1;41m\n Banco de dados funcionando ✅ \033[0m\n"; \
	fi

up-db: ## Start db container
	@$(DOCKER_COMPOSE) -f docker/db/db.yml up --build -d

up-app: ## Start app and nginx container.
	@$(DOCKER_COMPOSE) up --build -d

.PHONY: help
help: ## Ajuda.
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)