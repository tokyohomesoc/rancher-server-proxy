FROM tokyohomesoc/nginx-proxy-alpine

MAINTAINER HomeSOC Tokyo <github@homesoc.tokyo>


WORKDIR /template/
COPY nginx.tmpl /template/nginx.tmpl

CMD ["nginx", "-g", "daemon off;"]