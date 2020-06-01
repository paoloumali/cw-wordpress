#!/usr/bin/env bash

cd
sudo apt install -y mysql-server
sudo mysql -e "create user paoloumali@'localhost' identified by 'secret';";
sudo mysql -e "create database wordpress charset utf8mb4";
sudo mysql -e "grant all privileges on wordpress.* to paoloumali@'localhost'";
sudo mysql -e "flush privileges";

# .my.cnf, copy
