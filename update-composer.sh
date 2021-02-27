#!/bin/bash

source checkos.sh

echo "{}" >./service/composer.lock

IMAGENAME='lumen-8-dev'
# check that a docker image exists, otherwise build it
FOUND=$(docker images | grep -c ${IMAGENAME})
if [[ "$FOUND" -lt 1 ]]; then
  echo "no image found - create it"
  docker build --build-arg WITH_COMPOSER=true --build-arg WITH_COMPANY_WORKSTATION="$WITH_COMPANY_WORKSTATION" --tag ${IMAGENAME} .
else
  echo "image ${IMAGENAME} found - skip recreation"
fi

if $ISMAC; then
  docker run -v "$(pwd)":/code -w /code/service -it ${IMAGENAME} composer install
else
  winpty docker run -v "/$(pwd)/":/code -w //code/service -it ${IMAGENAME} composer install
fi
