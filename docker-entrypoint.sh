#!/bin/ash
#/////////////////////////////////////////////////
#// config
#/////////////////////////////////////////////////

rm -f /etc/nginx/conf.d/rancher-server_proxy.conf
mkdir -p /etc/nginx/conf.d/
[ -f /etc/nginx/conf.d/rancher-server_proxy.conf ] || cat <<EOF > /etc/nginx/conf.d/rancher-server_proxy.conf
upstream rancherserver {
    server ${RANCHER_SERVER};
}

server {
    listen       80  default_server;
    server_name  _;

    location / {
        proxy_set_header Host $host;
        proxy_set_header X-Forwarded-Proto $scheme;
        proxy_set_header X-Forwarded-Port $server_port;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_pass http://rancherserver;
        proxy_http_version 1.1;
        proxy_set_header Upgrade $http_upgrade;
        proxy_set_header Connection "Upgrade";
        # This allows the ability for the execute shell window to remain open for up to 15 minutes. Without this parameter, the default is 1 minute and will automatically close.
        proxy_read_timeout 900s;
    }
}
EOF

#/////////////////////////////////////////////////
#// nginx exec
#/////////////////////////////////////////////////
"$@"