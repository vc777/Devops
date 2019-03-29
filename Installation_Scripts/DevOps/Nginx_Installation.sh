#!/bin/sh

###############################################################
#FileName     :  Install-Apache.sh
#Purpose      :  Nginx Install on RedHat/CentOS Linux
#Version      :  0.1
#Author       :  Anand Reddy
#Created      :  29/12/18
###############################################################

#sudo su -

echo "################################################################"
echo "############# Nginx  Installation Started  ####################"
echo "################################################################"

sudo yum update -y

sudo yum install wget git unzip zip python php java-1.8.0-openjdk-devel -y

sudo yum install epel-release -y

sudo yum install nginx -y

systemctl enable nginx

sudo service nginx start