#!/bin/sh


docker-compose -f /usr/local/AppCentral/seafile/docker-compose.yml -p seafile pull
docker-compose -f /usr/local/AppCentral/seafile/docker-compose.yml -p seafile up -d
case "$APKG_PKG_STATUS" in
	install)
		;;
	upgrade)
		;;
	*)
		;;
esac
exit 0
