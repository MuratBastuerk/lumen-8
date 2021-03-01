#!/bin/bash

source setup.sh

# shellcheck disable=SC2143
if [ ! "$(docker ps -a | grep "${WEBCONTAINER}")" ]; then
  ./update-composer.sh && docker-compose -f docker-compose.yml -f docker-compose.dev.yml up --build -d
fi

$DOCKERCMD exec -it "${WEBCONTAINER}" bash