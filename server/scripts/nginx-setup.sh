#!/usr/bin/env bash

sudo su -
apt update
apt upgrade
# lsb_release -a

# NGINX setup, get from mainline
apt install curl gnupg2 ca-certificates lsb-release -y
echo "deb http://nginx.org/packages/mainline/debian \
  `lsb_release -cs` nginx" \
  | sudo tee /etc/apt/sources.list.d/nginx.list
curl -fsSL https://nginx.org/keys/nginx_signing.key | sudo apt-key add -
apt-key fingerprint ABF5BD827BD9BF62
apt update
apt install nginx

# nginx -v
# systemctl is-active nginx
# systemctl status nginx
systemctl start nginx
