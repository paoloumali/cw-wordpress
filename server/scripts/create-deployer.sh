#!/usr/bin/env bash

adduser forge --gecos GECOS --disabled-password
usermod --password bY1fJ3ZGP4csI forge
usermod -g www-data forge
echo "umask 022" >> /home/forge/.bashrc
mkdir /home/forge/sites
chown forge:www-data /home/forge/sites
chmod g+s /home/forge/sites
