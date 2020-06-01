#!/usr/bin/env bash

PROJ_DIR=/home/paoloumali/sites/cloudways.paoloumali.com
NGINX_H=/etc/nginx
NGINX_CONF=$NGINX_H/nginx.conf


cd
sudo apt update
sudo apt upgrade
# lsb_release -a

# NGINX setup, get from mainline
sudo apt install curl gnupg2 ca-certificates lsb-release -y
echo "deb http://nginx.org/packages/mainline/debian \
  `lsb_release -cs` nginx" \
  | sudo tee /etc/apt/sources.list.d/nginx.list
curl -fsSL https://nginx.org/keys/nginx_signing.key | sudo sudo apt-key add -
sudo apt-key fingerprint ABF5BD827BD9BF62
sudo apt update
sudo apt install nginx

# nginx -v
# systemctl is-active nginx
# systemctl status nginx
sudo systemctl start nginx

# configs
sudo mv $NGINX_CONF $NGINX_CONF.bak
sudo mv $NGINX_H/conf.d $NGINX_H/conf.d.bak

sudo ln -sf $PROJ_DIR/server/nginx/nginx.conf $NGINX_CONF
sudo ln -sf $PROJ_DIR/server/nginx/fastcgi.conf $NGINX_H/fastcgi.conf
sudo ln -sf $PROJ_DIR/server/nginx/conf.d $NGINX_H/conf.d
sudo ln -sf $PROJ_DIR/server/nginx/h5bp /etc/nginx/h5bp
sudo ln -sf $PROJ_DIR/server/nginx/snippets /etc/nginx/snippets
sudo ln -sf $PROJ_DIR/server/nginx/ssl /etc/nginx/ssl
