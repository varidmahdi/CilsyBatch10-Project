#!/usr/bin/env bash

echo "==========================="
echo "melakukan update repository"
echo "==========================="
sudo apt-get -y update

echo "==========================="
echo "install php untuk wordpress"
echo "==========================="
sudo apt-get -y install php libapache2-mod-php php-mysql

echo "==================================="
echo "melakukan install apache2 webserver"
echo "==================================="
sudo apt-get -y install apache2

echo "=============================="
echo "melakukan install mysql-server"
echo "=============================="
sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password password qwerty123'
sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password_again password qwerty123'
sudo apt-get -y install mysql-server

echo "=========================================="
echo "menghapus isi file yang ada di folder html"
echo "=========================================="
sudo rm -rf /var/www/html/*

echo "=================================="
echo "clone web sosial media dari github"
echo "=================================="
sudo git clone https://github.com/varidmahdi/sosial-media.git /var/www/html/

echo "================"
echo "setting database"
echo "================"
sudo mysql -uroot -pqwerty123 << EOF
CREATE DATABASE dbsosmed;
CREATE USER 'devopscilsy'@'localhost' IDENTIFIED BY '1234567890';
GRANT ALL PRIVILEGES ON *.* TO 'devopscilsy'@'localhost';
FLUSH PRIVILEGES;
EOF

echo "================"
echo "import databases"
echo "================"
sudo mysql -u devopscilsy -p1234567890 dbsosmed < /var/www/html/dump.sql
