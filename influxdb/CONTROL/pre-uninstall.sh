#!/bin/sh

echo "pre-uninstall"

container=$(docker container ls -a | grep influxdb | awk '{print $1}')
im=$(docker images | grep influxdb | grep latest | awk '{print $3}')

echo $container
echo $im

if [ ! -z $container ]; then 
	docker kill $container
	sleep 2
	docker rm -f $container
fi

if [ ! -z $im ]; then 
	if [ "$APKG_PKG_STATUS" == "uninstall" ]; then
		docker rmi -f $im
	fi
fi

