#!/usr/bin/env bash

echo "==========================="
echo "melakukan update repository"
echo "==========================="
sudo apt-get -y update

echo "==================================="
echo "melakukan install apache2 webserver"
echo "==================================="
sudo apt-get -y install apache2

echo "=========================================="
echo "menghapus isi file yang ada di folder html"
echo "=========================================="
sudo rm -rf /var/www/html/*

echo "=================================="
echo "clone web landing page dari github"
echo "=================================="
sudo git clone https://github.com/varidmahdi/landing-page.git /var/www/html/