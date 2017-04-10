FROM tokyohomesoc/nginx-proxy-alpine

MAINTAINER HomeSOC Tokyo <github@homesoc.tokyo>

WORKDIR /app/
VOLUME /app

COPY nginx.tmpl /app/nginx.tmpl

CMD ["nginx", "-g", "daemon off;"]