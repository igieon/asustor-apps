#!/bin/sh


docker run -itd --name=Gitea \
	--restart=unless-stopped \
	-p 10022:22 -p 13000:3000 \
	-v /volume1/gitea_data:/data \
	gitea/gitea:1.12.1


case "$APKG_PKG_STATUS" in
	install)
		;;
	upgrade)
		;;
	*)
		;;
esac
exit 0
