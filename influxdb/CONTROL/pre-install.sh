#!/bin/sh

echo "pre-install"

FOLDER=/share/Docker/influxdb
CONF_FOLDER=/share/Docker/influxdb/config

if [ ! -d $FOLDER ]; then
	mkdir -p $FOLDER
fi

# Make sure configuration directory exists
if [ ! -d $CONF_FOLDER ]; then
	mkdir -p $CONF_FOLDER
fi

docker pull influxdb:latest

case "$APKG_PKG_STATUS" in
	install)
		;;
	upgrade)
		;;
	*)
		;;
esac

exit 0
