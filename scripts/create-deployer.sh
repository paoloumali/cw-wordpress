#!/usr/bin/env bash

cd
sudo adduser paoloumali --gecos GECOS --disabled-password
sudo usermod --password bY1fJ3ZGP4csI -g www-data paoloumali
echo "umask 022" | sudo tee -a /home/paoloumali/.bashrc
sudo mkdir /home/paoloumali/sites
sudo chown paoloumali:www-data /home/paoloumali/sites
sudo chmod g+s /home/paoloumali/sites


# git repo
# git-stuff.sh, in vagrant, shared folder done
# proj => /home/paoloumali/sites/cloudways.paoloumali.com

sudo apt install git -y
sudo runuser -l paoloumali -c 'git clone /vagrant /home/paoloumali/sites/cloudways.paoloumali.com'
