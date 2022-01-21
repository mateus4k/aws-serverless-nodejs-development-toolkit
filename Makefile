.PHONY: help

start:
	docker-compose up --build -d
	docker exec -it serverless /bin/bash
stop:
	docker-compose down
setup:
	cp .env.example .env
