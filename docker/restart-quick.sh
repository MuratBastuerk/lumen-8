#!/bin/bash

source setup.sh

./stop.sh
## Start the development stack
docker-compose -f docker-compose.yml -f docker-compose.dev.yml up -d

# opens the logs in a new window
./logs.sh