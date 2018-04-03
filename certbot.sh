#!/bin/bash 

# RUN THIS AFTER docker-compose, so that nginx container is up
source .env

docker exec  ghostblog_nginx_1 /bin/bash -c "mkdir -p /etc/apt/sources.list.d/ && touch /etc/apt/sources.list.d/backports.list"
docker exec  ghostblog_nginx_1 /bin/bash -c " echo 'deb http://ftp.debian.org/debian stretch-backports main' > /etc/apt/sources.list.d/backports.list"
docker exec ghostblog_nginx_1 apt-get update
docker exec ghostblog_nginx_1 apt-get install python-certbot-nginx -t stretch-backports -y
docker exec -it ghostblog_nginx_1 certbot --nginx 
