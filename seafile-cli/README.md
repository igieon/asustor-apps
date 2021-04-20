# docker-seafile-client
Run a seafile client inside docker which can sync files from seafile repositories

See docker-compose how to use.

## Environment variables:
 - LIBRARY_ID=your-library-id-here   Can be multiple library ids seperated with colon :
 - SERVER_URL=server-url             The url used to access your server, eg: https://example.seafile.com
 - SERVER_PORT=server-port           Which port the server is hosted on: usually 443 (https) or 80 (http)
 - USERNAME=username                 Your account username (credentials)
 - PASSWORD=password                 Your account password (credentials)
 - DATA_DIR=directory-path-to-sync   The path where to put the files
 - CONNECT_RETRIES=number            How many times try to connect to daemon. Higher value is useful on slow boxes. Default is 5

## RUN
```bash
docker build . -t seafile-cli
export PASSWORD=
export LIBRARY_ID=
docker run --name seafile-cli -e LIBRARY_ID -e SEAFILE_UID=999 -e SEAFILE_GID=100 -e SERVER_URL=http://seafile -e SERVER_PORT=80 -e USERNAME=nas@nas.local -e PASSWORD -v /volume1/Docker/seafile-sync/seafile-client:/seafile-client -v /volume1/Docker/seafile-sync:/data --network seafile_seafile-net seafile-cli:latest 

```


