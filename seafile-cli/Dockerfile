FROM debian:buster-slim
COPY seafile-keyring.asc /usr/share/keyrings/seafile-keyring.asc
RUN apt-get update && apt-get install -y ca-certificates && \
	echo 'deb [arch=amd64 signed-by=/usr/share/keyrings/seafile-keyring.asc] https://linux-clients.seafile.com/seafile-deb/buster/ stable main'|tee /etc/apt/sources.list.d/seafile.list && \
	apt-get update && \
    apt-get install -y seafile-cli procps curl grep && \
	apt-get autoremove --yes && \	
    apt-get clean && apt-get autoclean && \
    rm -rf \
        /var/log/fsck/*.log \
        /var/log/apt/*.log \
        /var/cache/debconf/*.dat-old \
        /var/lib/apt/lists/* 


COPY start.sh /start.sh

RUN chmod +x /start.sh && \
    useradd -U -d /seafile-client -s /bin/bash seafile && \
    usermod -G users seafile

CMD ["/start.sh"]
