#!/usr/bin/env bash
# Install and configure a web server

# Install Nginx if it not already installed
if [[ -z $(command -v nginx) ]]; then
	
	apt-get -y update
	apt-get -y install nginx
	
	if [[ -n $(command -v ufw) ]]; then
		ufw allow 'Nginx HTTP'
	fi

fi

sudo mkdir -p /data/web_static/releases/test /data/web_static/shared
echo "Hello world!\nThis is a test..." | sudo tee /data/web_static/releases/test/index.html
sudo ln -sf /data/web_static/releases/test/ /data/web_static/current
sudo chown -hR ubuntu:ubuntu /data/
sudo sed -i '38i\\tlocation /hbnb_static/ {\n\t\talias /data/web_static/current/;\n\t}\n' /etc/nginx/sites-available/default
sudo service nginx start
