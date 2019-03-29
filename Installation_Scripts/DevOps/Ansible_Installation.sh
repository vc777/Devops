#!/bin/sh

###############################################################
#Purpose      :  Ansible Install on RedHat Linux
#Version      :  0.1
#Author       :  Anand Reddy
#Created      :  29/12/18
###############################################################

#sudo su -

echo "################################################################"
echo "############# Ansible Installation Started  ####################"
echo "################################################################"

sudo yum update -y

sudo yum install wget git unzip zip python php java-1.8.0-openjdk-devel -y

sudo mkdir -p /opt/scripts/ansible

sudo wget https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm

sudo rpm -Uvh https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm

sudo yum -y install ansible