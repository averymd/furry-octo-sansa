#!/usr/bin/env bash

apt-get update
sudo debconf-set-selections <<< 'mysql-server-5.5 mysql-server/root_password password 0233235'
sudo debconf-set-selections <<< 'mysql-server-5.5 mysql-server/root_password_again password 0233235'
apt-get install -y apache2 python sqlite3 mysql-server git
rm -rf /var/www
ln -fs /vagrant /var/www