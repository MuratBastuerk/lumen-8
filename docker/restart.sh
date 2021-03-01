#!/bin/bash

source setup.sh

./stop.sh

if [[ $* == *-c* ]]; then
  ## get dependencies
  ./start.sh -c
else
  ./start.sh
fi
