#!/bin/bash

source setup.sh
# Stop the stack
docker-compose --env IMAGENAME="${IMAGENAME}" -f docker-compose.yml -f docker-compose.dev.yml down
