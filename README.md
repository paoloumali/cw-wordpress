# cloudways.paoloumali.com

## Prod notes

- Nginx config is linked from  
.../sites-available/cloudways.paoloumali.com.nginx.conf  
to the corresponding file at root of this repo.

## Nginx and PHP notes

```bash
NGINX_CONF_HOME=/home/paoloumali/sites/cloudways.paoloumali.com/server/nginx
PHP_CONF_HOME=/home/paoloumali/sites/cloudways.paoloumali.com/server/php

sudo ln -sf $NGINX_CONF_HOME/nginx.conf
sudo ln -sf $NGINX_CONF_HOME/conf.d/caching.conf
sudo ln -sf $NGINX_CONF_HOME/snippets/wordpress.conf
sudo ln -sf $NGINX_CONF_HOME/snippets/dont-log-favs-and-robs.conf
sudo ln -sf $NGINX_CONF_HOME/sites-available/cloudways.paoloumali.com.nginx.conf
sudo ln -sf $NGINX_CONF_HOME/sites-available/cw-backend.conf
sudo ln -sf $NGINX_CONF_HOME/sites-available/cw-front.conf
sudo ln -sf $NGINX_CONF_HOME/h5bp
sudo ln -sf $PHP_CONF_HOME/7.4/fpm/php-fpm.conf
sudo ln -sf $PHP_CONF_HOME/7.4/fpm/pool.d/www.conf
```

## SSL

- Add redirect in nginx config
- Force [WP Settings](http://cloudways.paoloumali.com/wp-admin/options-general.php) to use https on all pages
  - WordPress Address (URL)
  - Site Address (URL)

## Temp Git deployer

- Setup branch protection on master.
- Git user in deployment dest
  - git config --global user.email dev+remote@paoloumali.com
  - git config --global user.name "paoloumali"
- on pull
  - git pull
  - returned negative
    - consider
      - git push origin -f master:previous
      - git reset --soft HEAD~1
      - git fetch origin
      - git stash
      - git pull

## Local deployment

Since future wordpress edits require a server,  
let's introduce a common environment for devs to  
use employing Vagrant

.d script is used for short commands

- Start server: $ ``d v up``
- Halt server: $ ``d v halt``
- SSH to server: $ ``d v ssh``
- Destroy vm: $ ``d v destroy``
- Snapshot create: $ ``d v snapshot push``
- Restore latest pushed state: $ ``d v snapshot pop``

## Backups

Create cron task: ``30 16 * * * ${PROJ_DIR}/_backup-now.sh``
When ${PROJ_DIR}/_backup-daily.sh runs:
  - it creates a new timed dir in ${PROJ_DIR}/backups/bucket
  - it creates /public and db symlinks in ${PROJ_DIR}/backups/latest
  - preps a restore folder ${PROJ_DIR}/backups/restore
