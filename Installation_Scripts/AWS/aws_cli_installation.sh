#!/bin/sh

###############################################################
#Purpose      :  AWS CLI Installation on RedHat/CentOs Linux
#Version      :  0.1
#Author       :  Anand Reddy
#Created      :  10/01/19
###############################################################

sudo yum update -y

sudo yum install epel-release -y

# These are optional

sudo yum install wget git unzip zip php java-1.8.0-openjdk-devel -y

sudo yum -y install python-pip

#Upgrade pip to the latest release
#sudo pip install --upgrade pip

sudo pip install awscli

# To upgrade pip to the latest version, run:
#sudo pip install awscli --upgrade

aws --version