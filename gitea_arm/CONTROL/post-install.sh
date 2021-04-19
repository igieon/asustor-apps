#!/bin/sh
echo "post-install"
docker pull gitea/gitea:latest

CONTAINER_TEST=$(docker container ls -a | grep Gitea | awk '{print $1}')

if [ ! -z $CONTAINER_TEST ]; then
	docker rm -f $CONTAINER_TEST
fi

docker create -i -t --name=Gitea \
	--restart=unless-stopped \
	-p 10022:22 -p 13000:3000 \
	-v /volume1/gitea_data:/data \
	gitea/gitea:latest


case "$APKG_PKG_STATUS" in
	install)
		;;
	upgrade)
		oldim=$(docker images | grep gitea/gitea | grep none | awk '{print $3}')
		echo $oldim

		if [ ! -z $oldim ]; then
			docker rmi -f $oldim
		fi
		;;
	*)
		;;
esac
exit 0
