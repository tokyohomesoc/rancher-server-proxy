FROM tokyohomesoc/nginx

MAINTAINER HomeSOC Tokyo <github@homesoc.tokyo>

RUN apk add --no-cache bash

WORKDIR /app/

COPY docker-entrypoint.sh /app/
COPY rancher-server_proxy.conf /etc/nginx/conf.d

ENTRYPOINT ["/bin/bash", "/app/docker-entrypoint.sh" ]