#!/bin/sh

echo "pre-uninstall"

docker-compose -f /usr/local/AppCentral/seafile/docker-compose.yml -p seafile kill
docker-compose -f /usr/local/AppCentral/seafile/docker-compose.yml -p seafile rm



