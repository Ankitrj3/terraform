#!/bin/bash

sudo apt update
sudo apt install nginx -y
sudo systemctl start nginx
sudo systemctl enable nginx
echo "Nginx installed and started successfully"
echo "You can access Nginx at http://your_ec2_public_ip"