#!/bin/bash
echo "DIGITALOCEAN_PASSWORD=$DIGITALOCEAN_PASSWORD" >> /etc/environment
echo "DIGITALOCEAN_USER=$DIGITALOCEAN_USER" >> /etc/environment
echo "MYSQL_PASSWORD=$MYSQL_PASSWORD" >> /etc/environment
echo "MYSQL_USER=$MYSQL_USER" >> /etc/environment
BASH_ENV=/etc/environment /usr/local/bin/backup.sh