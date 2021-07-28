#!/bin/sh
wget -q -O - https://pkg.jenkins.io/debian/jenkins.io.key | sudo apt-key add -
sudo sh -c 'echo deb https://pkg.jenkins.io/debian-stable binary/ > \
/etc/apt/sources.list.d/jenkins.list'
sudo apt-get update
sudo apt-get install jenkins -y
sudo apt-get install openjdk-11-jdk -y
#sudo apt-get install openjdk-8-jdk
sudo systemctl restart jenkins
sudo systemctl status jenkins