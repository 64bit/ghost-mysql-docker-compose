# ghost-mysql-docker-compose
Production ready solution to start Ghost along with Mysql & Nginx using docker compose.

For setting up on production follow [README.md](https://github.com/64bit/ghost-mysql-docker-compose/blob/production/README.md) on `production` branch.

# To run on local machine: 

## Configuration
All configurations are defined in .env file. Configurations like 
- Mysql user, password, db
- persistent storage for nginx, mysql & ghost containers.

## Usage
1. Start: `docker-compose -f stack.yaml up -d`
2. Go to: [http://localhost](http://localhost)

To see how the final `stack.yaml` would look like after variable substitutions: 
`docker-compose -f stack.yaml config`
