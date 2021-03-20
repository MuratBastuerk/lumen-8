#!/bin/bash

### SET & EXPORT DEFAULTS ###
cd ..
export IMAGENAME="${PWD##*/}"
cd docker || exit
export WEBCONTAINER="${IMAGENAME}_web"
export POSTGRESCONTAINER="${IMAGENAME}_postgres"
# shellcheck disable=SC2155
export FOUNDIMAGE=$(docker images | grep -c "${IMAGENAME}")
# OS TYPE
ISMAC=false
DOCKERCMD="winpty docker"
if [[ "$OSTYPE" == "darwin"* ]]; then
# shellcheck disable=SC2034
ISMAC=true
DOCKERCMD="docker"
fi;
export ISMAC
export DOCKERCMD

### CREATE IMAGE ###
if [[ $FOUNDIMAGE -lt 1 ]]; then
  echo "### CREATE IMAGE ###"
  docker build --build-arg WITH_XDEBUG=true --tag "${IMAGENAME}" ..
fi
