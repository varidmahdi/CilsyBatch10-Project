#!/usr/bin/env bash

echo "==========================="
echo "melakukan update repository"
echo "==========================="
sudo apt-get -y update

echo "========================================="
echo "install webserver dan php untuk wordpress"
echo "========================================="
sudo apt-get -y install php libapache2-mod-php php-mysql
sudo apt-get -y install apache2
sudo service apache restart

echo "=============================="
echo "melakukan install mysql-server"
echo "=============================="
sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password password qwerty123'
sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password_again password qwerty123'
sudo apt-get -y install mysql-server

echo "=============================================="
echo "membuat database dan user baru untuk wordpress"
echo "=============================================="
sudo mysql -uroot -pqwerty123 << EOF
CREATE DATABASE wordpress;
CREATE USER 'wordpress'@'localhost' IDENTIFIED BY 'qwerty123';
GRANT ALL PRIVILEGES ON wordpress.* TO 'wordpress'@'localhost';
FLUSH PRIVILEGES;
EOF

echo "=========================================="
echo "menghapus isi file yang ada di folder html"
echo "=========================================="
sudo rm -rf /var/www/html/*

echo "=================="
echo "download wordpress"
echo "=================="
wget https://id.wordpress.org/latest-id_ID.tar.gz

echo "================================"
echo "extract wordpress ke folder html"
echo "================================"
tar xvf latest-id_ID.tar.gz
sudo mv wordpress/* /var/www/html/