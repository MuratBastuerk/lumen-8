#!/bin/bash

source checkos.sh

echo "{}" >./service/composer.lock

IMAGENAME='lumen-8'
# check that a docker image exists, otherwise build it
FOUND=$(docker images | grep -c ${IMAGENAME})
if [[ "$FOUND" -lt 1 ]]; then
  echo "no image found - create it"
  docker build --build-arg WITH_XDEBUG=true --tag ${IMAGENAME} .
else
  echo "image ${IMAGENAME} found - skip recreation"
fi

if $ISMAC; then
  docker run -v "$(pwd)/service":/var/www/html -w /var/www/html -it ${IMAGENAME} composer install -n
else
  winpty docker run -v "/$(pwd)/service/":/var/www/html -w //var/www/html -it ${IMAGENAME} composer install -n
fi
