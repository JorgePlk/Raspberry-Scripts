#!/bin/bash

if [ "$(whoami)" != "root" ]; then
    echo "Run script as ROOT please. (sudo !!)"
    exit
fi

## Installing apache
echo "Installing Apache2"
apt install -y apache2
chown -R pi:www-data /var/www/html/
chmod -R 770 /var/www/html
echo "DONE"

## Installing PHP
echo "Installing PHP"
apt install php php-mbstring
phpenmod mysqli
echo "DONE"

## Installing BDManager
echo "Installing DBManager"
apt install mysql-server php-mysql
echo "DONE"

## Installing phpMyAdmin
echo "Installing phpMyAdmin"
apt install phpmyadmin
ln -s /usr/share/phpmyadmin /var/www/html/phpmyadmin
echo "DONE"
