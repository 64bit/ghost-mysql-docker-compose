#!/bin/bash
docker exec  mysql_container bash -c 'backup_name=$(date +%Y-%m-%d-%H-%M-%s); backup_file=/var/lib/blog/backups/mysqldump-$backup_name.sql; echo $backup_file; mysqldump --single-transaction --no-create-db  --no-create-info --user=$MYSQL_USER  --password=$MYSQL_PASSWORD  --result-file=$backup_file $MYSQL_DATABASE;' 
