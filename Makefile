.SILENT :
.PHONY : rancher-server-proxy

rancher-server-proxy:
	docker build -t tokyohomesoc/rancher-server-proxy:test .
	docker images
    docker history tokyohomesoc/rancher-server-proxy:test