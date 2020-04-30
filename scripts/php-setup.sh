#!/usr/bin/env bash

PROJ_DIR=/home/huenisys/sites/cloudways.paoloumali.com
FPM_CONF=/etc/php/7.4/fpm/php-fpm.conf
POOL_WWW_CONF=/etc/php/7.4/fpm/pool.d/www.conf

cd
sudo apt -y install lsb-release apt-transport-https ca-certificates
sudo wget -O /etc/apt/trusted.gpg.d/php.gpg https://packages.sury.org/php/apt.gpg
echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" | sudo tee /etc/apt/sources.list.d/php.list
sudo apt update
sudo apt -y install php7.4-fpm

sudo apt install -y php7.4-curl php7.4-xml php7.4-common php7.4-json php7.4-mbstring php7.4-mysql php-libsodium php-imagick php7.4-zip php7.4-gd php-ssh2

sudo mv $FPM_CONF $FPM_CONF.bak
sudo mv $POOL_WWW_CONF $POOL_WWW_CONF.bak

sudo ln -sf $PROJ_DIR/server/php/7.4/fpm/php-fpm.conf $FPM_CONF
sudo ln -sf $PROJ_DIR/server/php/7.4/fpm/pool.d/www.conf $POOL_WWW_CONF
