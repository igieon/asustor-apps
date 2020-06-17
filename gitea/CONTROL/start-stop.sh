#!/bin/sh -e


case "$1" in
    start)
        echo "Start Gitea  container ..."
        docker start Gitea 
        sleep 10                        
        ;;
    stop)
    	echo "Stop Gitea container ..."
    	docker stop Gitea
		sleep 5
        ;;
    reload)
    	echo "Reload Gitea container ..."
    	docker stop Gitea
    	sleep 5
    	docker start Gitea
        ;;
    *)
        echo "Usage: $0 {start|stop|reload}"
        exit 1
        ;;
esac
exit 0
