#!/bin/bash

cd ../
. .env

# Start containers
docker compose --profile backend up -d

# Attach shell
docker exec -it "$API_CONTAINER_NAME" bash

# Stop containers
docker compose --profile backend stop
