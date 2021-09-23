.PHONY: help

setup:
	cp .env.example .env
start:
	docker-compose up --build -d
	docker exec -it serverless /bin/bash
