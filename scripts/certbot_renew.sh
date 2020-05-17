#!/bin/bash 

# RUN THIS AFTER certs are setup. 
docker exec  nginx_container /bin/bash -c "mkdir -p /etc/apt/sources.list.d/ && touch /etc/apt/sources.list.d/backports.list"
docker exec  nginx_container /bin/bash -c " echo 'deb http://ftp.debian.org/debian stretch-backports main' > /etc/apt/sources.list.d/backports.list"
docker exec nginx_container apt-get update
docker exec nginx_container apt-get install python-certbot-nginx -t stretch-backports -y
docker exec -it nginx_container certbot renew --dry-run
