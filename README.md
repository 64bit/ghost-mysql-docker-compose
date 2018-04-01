# ghost-mysql-docker-compose
Production ready solution to start Ghost along with Mysql using docker compose in single command. 


## Intro

Mysql user, password, db is read from `.env` file. Container data is persisted as follows:
- `./ghostdata` is mounted at `/var/lib/ghost/content` in container
- `./mysqldata` is mounted at `/var/lib/mysql` in container 

## Usage

1. Configure: `MYSQL_USER`, `MYSQL_PASSWORD`, `MYSQL_DATABASE` in `.env` file to be used by Ghost. 
2. Start: `docker-compose -f stack.yaml up`
