#!/bin/sh

echo "post-install"

# App Central extend timeout, but the timeout seems be counted from post-install, not pre-install, so move "docker pull" to post-install.

docker pull influxdb:latest

echo "Completed docker pull"


CONTAINER_TEST=$(docker container ls -a | grep influxdb | awk '{print $1}')

if [ ! -z $CONTAINER_TEST ]; then
	docker rm -f $CONTAINER_TEST
fi



C_UID=$(id -u admin)
ADMIN_GID=$(id -g admin)

docker create -i -t --name=influxdb \
	-p 8086:8086 \
	-v /share/Docker/influxdb/data:/var/lib/influxdb2 \
	-v /share/Docker/influxdb/config:/etc/influxdb2 \
	--restart unless-stopped \
	influxdb:latest
  	
docker start influxdb


case "$APKG_PKG_STATUS" in
	install)
		;;
	upgrade)
		;;
	*)
		;;
esac

exit 0
