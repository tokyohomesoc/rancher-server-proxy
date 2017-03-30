FROM tokyohomesoc/nginx-proxy-alpine

MAINTAINER HomeSOC Tokyo <github@homesoc.tokyo>


WORKDIR /app/
COPY nginx.tmpl /app/nginx.tmpl

ENTRYPOINT ["/init"]