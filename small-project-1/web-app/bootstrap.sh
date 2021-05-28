#!/usr/bin/env bash

echo "==========================="
echo "melakukan update repository"
echo "==========================="
#sudo apt-get update

echo "==========================="
echo "install php untuk wordpress"
echo "==========================="
sudo apt install php libapache2-mod-php php-mysql

echo "==================================="
echo "melakukan install apache2 webserver"
echo "==================================="
#sudo apt-get -y install apache2

echo "=============================="
echo "melakukan install mysql-server"
echo "=============================="
#sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password password qwerty123'
#sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password_again password qwerty123'
#sudo apt-get -y install mysql-server

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
#sudo rm -rf /var/www/html/*

echo "=================================="
echo "clone web landing page dari github"
echo "=================================="
#sudo mkdir /var/www/html/landing-page
#sudo git clone https://github.com/varidmahdi/landing-page.git /var/www/html/landing-page

echo "=================="
echo "download wordpress"
echo "=================="
#wget https://id.wordpress.org/latest-id_ID.tar.gz

echo "================================"
echo "extract wordpress ke folder html"
echo "================================"
#tar xvf latest-id_ID.tar.gz --directory /var/www/html/

echo "=================================="
echo "clone web sosial media dari github"
echo "=================================="
#sudo mkdir /var/www/html/sosial-media
#sudo git clone https://github.com/varidmahdi/sosial-media.git /var/www/html/sosial-media

