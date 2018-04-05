#!/bin/bash 

# RUN THIS AFTER certs are setup. 
docker exec -it nginx_container certbot renew --dry-run
