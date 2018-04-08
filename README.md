# ghost-mysql-docker-compose
Production ready solution to start Ghost along with Mysql & Nginx using docker compose.

## Step 0:
Prerequisites is to have a domain name which resolves to machine where Ghost is being installed. 

## Step 1 Configuration:

Checklist for all parameters to be set for your Ghost installation in production

* Parameters that need to be set in `.env` file:

  - MYSQL_USER
  - MYSQL_PASSWORD
  - MYSQL_DATABASE 
  - GHOST_URL: make sure its a https url https://yourdomain.com 

  Rest all are container storage mounted from host directories and can be left default values.

* Edit `./nginxdata/etc/nginx/conf.d/ghost.conf`: for server_name put your domain: 
  - `server_name yourdomain.com www.yourdomain.com;`
  
  
* Edit `scripts/certbot.sh`: 
  - Change DOMAINS to comma seperated list of your domains. 
    `DOMAINS=yourdomain.com,www.yourdomain.com`
  - Change EMAIL
 
* Commit your changes to `production` branch, push changes to `<your-repo>`.

* To see how the final stack.yaml would look like after variable substitutions: docker-compose -f stack.yaml config
  
## Step 2 Installation & Running:  

I assume you have Ubuntu 16.04 with git, docker, docker-compose installed. 

* Create `blog` user: `adduser blog`
* Add `blog` user to `sudo` group: `usermod -aG sudo blog`
* Switch to `blog` user: `su - blog`
* Change directory: `cd /opt`
* Clone respository: `sudo git clone <your-repo> blog`
* Change ownership to `blog` user: `sudo chown -R blog /opt/blog`
* Change directory: `cd /opt/blog`
* Change branch: `git checkout production`
* Bring it up: `sudo docker-compose -f stack.yaml up -d` 

At this point monitor ghost & mysql logs to see if everything comes up file:
`sudo docker logs -f mysql_container` : In these logs you will also find mysql root password
`sudo docker logs -f ghost_container` : see that its able to finally connect to mysql and create tables. 

If everything came up fine, at this point http://yourdomain.com/.well-known should work. Also http://yourdomain.com/ghost should redirect to https. 

## Step 3 Installing certificates for HTTPS:
To be able to access Ghost we need to install certificate next. 
* run `scripts/certbot.sh` : at the end it should succesfully install certificate and modify `ghost.conf` in nginx container. 

## Step 4: Fun Begins:
* access `https://yourdomain.com/ghost` and create Ghost account. 
* Write amazing blogs! 








