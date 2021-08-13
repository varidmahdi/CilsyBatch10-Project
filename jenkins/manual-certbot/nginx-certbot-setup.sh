#!/bin/sh
# For Ubuntu 18.04
# sudo apt install nginx software-properties-common
sudo add-apt-repository ppa:certbot/certbot
sudo apt update
sudo apt install python-certbot-nginx
sudo rm -rf /etc/nginx/sites-enabled/default
# sudo apt install certbot
sudo certbot certonly --standalone -d jenkins.domain.id
sudo mkdir /etc/nginx/ssl/
sudo openssl dhparam -out /etc/nginx/ssl/dhparam.pem 2048
sudo service nginx stop
sudo vim /etc/nginx/sites-available/jenkins.domain.id
sudo ln -s /etc/nginx/sites-available/jenkins.domain.id /etc/nginx/sites-enabled/jenkins.domain.id
sudo nginx -t
sudo systemctl restart nginx