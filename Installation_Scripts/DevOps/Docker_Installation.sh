#!/bin/sh

###############################################################
#FileName     :  Install-Docker-on-Centos/RHEL.sh
#Purpose      :  Jenkins Install on RedHat/CentOS Linux
#Version      :  0.1
#Author       :  Anand Reddy
#Created      :  29/12/18
###############################################################

#sudo su -

echo "################################################################"
echo "############# Docker  Installation Started  ####################"
echo "################################################################"


sudo yum update -y

sudo yum install wget git unzip zip python php java-1.8.0-openjdk-devel -y

sudo mkdir -p /opt/scripts/ansible

sudo curl -O -k https://download.docker.com/linux/centos/7/x86_64/stable/Packages/docker-ce-selinux-17.03.2.ce-1.el7.centos.noarch.rpm

sudo curl -O -k https://download.docker.com/linux/centos/7/x86_64/stable/Packages/docker-ce-17.03.2.ce-1.el7.centos.x86_64.rpm

sudo yum install docker-ce-selinux-17.03.2.ce-1.el7.centos.noarch.rpm -y

sudo yum install docker-ce-17.03.2.ce-1.el7.centos.x86_64.rpm -y

sudo systemctl enable docker

sudo service docker start

