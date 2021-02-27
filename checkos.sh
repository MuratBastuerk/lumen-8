#!/bin/bash

ISMAC=false

if [[ "$OSTYPE" == "darwin"* ]]; then
# shellcheck disable=SC2034
ISMAC=true
fi;