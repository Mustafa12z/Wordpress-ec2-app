#!/bin/bash


yum update -y


yum install -y httpd
systemctl start httpd
systemctl enable httpd


yum install -y mariadb105-server php php-mysqlnd
systemctl start mariadb
systemctl enable mariadb


rm -f /var/www/html/index.html


cd /var/www/html
wget https://wordpress.org/latest.tar.gz
tar -xzf latest.tar.gz
mv wordpress/* ./
rm -rf wordpress latest.tar.gz

chown -R apache:apache /var/www/html/
chmod -R 755 /var/www/html/


systemctl restart httpd
