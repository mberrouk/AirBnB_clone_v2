#!/usr/bin/env bash
# Install and configure a web server

# Install Nginx if it not already installed
if [[ -z $(which nginx) ]];
then
	sudo apt-get -y update
	sudo apt-get -y install nginx
	sudo ufw allow 'Nginx HTTP'
fi
