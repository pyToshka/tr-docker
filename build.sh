#!/usr/bin/env bash

if [ ! -f ./containers/php-fpm.tar ]; then
 packer build app.json
fi

docker import containers/php-fpm.tar  php-fpm:latest
docker-compose up --build --remove-orphans -d
sleep 1
echo "Scaleup application to 2 backend"
docker-compose scale nginx-app=2
