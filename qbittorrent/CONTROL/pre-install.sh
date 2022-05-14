#!/bin/sh

echo "pre-install"

QB_FOLDER=/share/Docker/qBittorrent
QB_CONF_FOLDER=/share/Docker/qBittorrent/config
QB_CONF_QB_FOLDER=/share/Docker/qBittorrent/config/qBittorrent
QB_CONF_FILE=/share/Docker/qBittorrent/config/qBittorrent/qBittorrent.conf

# 1st time install this app, copy default qBittorrent.conf to avoid random error happened, and default enable HTTPS.
if [ ! -d $QB_FOLDER ]; then
	mkdir -p $QB_FOLDER
fi

# Make sure configuration directory exists
if [ ! -d $QB_CONF_FOLDER ]; then
	mkdir -p $QB_CONF_FOLDER
	mkdir -p $QB_CONF_QB_FOLDER
fi

docker pull lscr.io/linuxserver/qbittorrent:latest

case "$APKG_PKG_STATUS" in
	install)
		;;
	upgrade)
		;;
	*)
		;;
esac

exit 0
