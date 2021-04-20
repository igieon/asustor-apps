#!/bin/sh -e


case "$1" in
    start)
        echo "Start Gitea  container ..."
        docker-compose -f /usr/local/AppCentral/seafile/docker-compose.yml -p seafile start
        sleep 10
        ;;
    stop)
    	echo "Stop Gitea container ..."
      docker-compose -f /usr/local/AppCentral/seafile/docker-compose.yml -p seafile stop
		sleep 5
        ;;
    reload)
    	echo "Reload Gitea container ..."
      docker-compose -f /usr/local/AppCentral/seafile/docker-compose.yml -p seafile restart
        ;;
    *)
        echo "Usage: $0 {start|stop|reload}"
        exit 1
        ;;
esac
exit 0
