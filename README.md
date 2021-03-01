# Dockerized Laravel/Lumen-8 Template
You can use this template for web development with Lumen 8 Framework.
It comes with a container providing: Supervisor, Nginx, Cron, PHP, Xdebug, OpCacheComposer, SSL and HTTPS inside.

## What's inside
It comes with a container providing:
- Supervisor, 
- Nginx, 
- Cron, 
- PHP 7.4.14, 
- Xdebug, 
- OpCache, 
- Composer, 
- SSL and 
- HTTPS 

Check out the base image's project: https://github.com/MuratBastuerk/php-base. 

## Requirements
Having a docker machine running with mounting permissions.

## Install and run it
This instruction will spin up a postgres database, and the web stack via docker-compose.
Nginx will use `/var/www/html/` as your root. Lumen's `index.php` lays`/var/www/html/public`.
The configuration uses following ports: 
- `Web: 443`
- `Postgres: 5432`

for `localhost`.

1. Open up a bash based terminal
2. Run: `cp /service/.env.example  .env`
   - Adjust `.env` to your liking
3. Navigate to: `cd docker`
4. Run `./start.sh -c`
5. Open `https://localhost` in your browser.

## Other scripts
There are a few helper scripts inside the `docker`-folder:
1. `setup.sh` initializes the defaults for your envrionment and builds the docker image if needed.
2. `start.sh ` starts your stack and rebuilds the image. Use `-c`-Flag for installing composer dependencies.
3. `restart.sh` restarts your stack and rebuilds the image. Use `-c`-Flag for installing composer dependencies.
4. `restart-quick.sh` just restarts the stack quickly.
5. `update-composer.sh` installs your composer dependencies into the container. You should use it after you've edited your `service/composer.json`.
6. `logs.sh` prints the log-stream of your running stack.
7. `log-into-web.sh` logs you into the web container with bash.
8. `stop.sh`shuts down your stack.
