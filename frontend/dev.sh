#!/bin/bash

cd ../
. .env

# Start containers
docker compose --profile frontend up -d

# Attach shell
docker exec -it "$WEB_CONTAINER_NAME" bash

# Stop containers
docker compose --profile frontend stop
