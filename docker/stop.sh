#!/bin/bash

source setup.sh
# Stop the stack
docker-compose -f docker-compose.yml -f docker-compose.dev.yml down
