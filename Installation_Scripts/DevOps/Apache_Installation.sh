#!/bin/sh

###############################################################
#Purpose      :  Apache Install on RedHat/CentOS Linux
#Version      :  0.1
#Author       :  Anand Reddy
#Created      :  29/12/18
###############################################################

#sudo su -

echo "################################################################"
echo "############# Apache  Installation Started  ####################"
echo "################################################################"

sudo yum update -y

sudo yum install wget git unzip zip python php java-1.8.0-openjdk-devel -y

sudo yum install httpd -y

systemctl enable httpd

sudo service httpd start