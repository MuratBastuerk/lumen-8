#!/bin/bash

### SET & EXPORT DEFAULTS ###
cd ..
export IMAGENAME="${PWD##*/}"
DOCKERCMD="docker"
cd docker || exit
export WEBCONTAINER="${IMAGENAME}_web"
export POSTGRESCONTAINER="${IMAGENAME}_postgres"
# shellcheck disable=SC2155
export FOUNDIMAGE=$(docker images | grep -c "${IMAGENAME}")
# OS TYPE
ISMAC=false
if [[ "$OSTYPE" == "darwin"* ]]; then
# shellcheck disable=SC2034
ISMAC=true
DOCKERCMD="winpty docker"
fi;
export DOCKERCMD

### CREATE IMAGE ###
if [[ $FOUNDIMAGE -lt 1 ]]; then
  echo "### CREATE IMAGE ###"
  docker build --build-arg WITH_XDEBUG=true --tag "${IMAGENAME}" ..
fi