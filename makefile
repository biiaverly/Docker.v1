# Docker compose version.
ifneq (,$(wildcard /usr/local/bin/docker-compose))
	DOCKER_COMPOSE := docker-compose
else
	DOCKER_COMPOSE := docker compose
endif

# Functions 
.DEFAULT_GOAL := help

.PHONY: up-db up-app

up-db: ## Start db container
	docker compose -f docker/db/db.yml up --build -d

up-app: ## Start app and nginx container.
	docker compose up --build -d

up: ## Start all containers
	@$(MAKE) up-db $(MAKE) up-app 


.PHONY: help
help: ## Ajuda.
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)