#!/bin/bash

source setup.sh

if [[ $* == *-c* ]]; then
  ## get dependencies
  ./update-composer.sh
fi

## Start the development stack
docker-compose -f docker-compose.yml -f docker-compose.dev.yml up --build -d
# opens the logs in a new window
./logs.sh
