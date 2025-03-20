#!/bin/bash
apt update -y
apt install -y apache2
systemctl start apache2
systemctl enable apache2
echo "Hello from User Data Script!" > /var/www/index.html
