#!/bin/bash

source setup.sh

cd ..
echo "{}" > service/composer.lock
if $ISMAC; then
  $DOCKERCMD run -v "$(pwd)/service":/var/www/html -w /var/www/html -it "${IMAGENAME}" composer install -n
else
  $DOCKERCMD run -v "/$(pwd)/service/":/var/www/html -w //var/www/html -it "${IMAGENAME}" composer install -n
fi
cd - || exit