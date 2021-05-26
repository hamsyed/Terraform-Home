#!/bin/bash
sudo yum install httpd -y
sudo systemctl start httpd 
sudo systemctl enable httpd 
echo "helloworld" >> /var/www/html/index.html
