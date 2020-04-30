#!/usr/bin/env bash

cd
sudo adduser huenisys --gecos GECOS --disabled-password
sudo usermod --password bY1fJ3ZGP4csI -g www-data huenisys
echo "umask 022" | sudo tee -a /home/huenisys/.bashrc
sudo mkdir /home/huenisys/sites
sudo chown huenisys:www-data /home/huenisys/sites
sudo chmod g+s /home/huenisys/sites


# git repo
# git-stuff.sh, in vagrant, shared folder done
# proj => /home/huenisys/sites/cloudways.paoloumali.com

sudo apt install git -y
sudo runuser -l huenisys -c 'git clone /vagrant /home/huenisys/sites/cloudways.paoloumali.com'