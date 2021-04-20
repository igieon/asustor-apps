#!/bin/sh

echo "pre-install"

docker pull  memcached:1.5.6
docker pull  mariadb:10.5
docker pull  seafileltd/seafile-mc:latest