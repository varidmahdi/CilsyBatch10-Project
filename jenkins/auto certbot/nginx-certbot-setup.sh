#!/bin/sh
sudo apt install certbot python3-certbot-nginx -y
sudo rm -rf /etc/nginx/sites-enabled/default
sudo vim /etc/nginx/sites-available/jenkins.domain.id
sudo ln -s /etc/nginx/sites-available/jenkins.domain.id /etc/nginx/sites-enabled/jenkins.domain.id
sudo certbot --nginx -d jenkins.domain.id
sudo nginx -t
sudo systemctl restart nginx