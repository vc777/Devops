#!/bin/sh

###############################################################
#Purpose      :  Monit Installation on RedHat/CentOS Linux
#Version      :  0.1
#Author       :  R Anand Reddy
#Created      :  29/12/18
###############################################################

#sudo su -

echo "################################################################"
echo "################ Monit Installation Started  ###################"
echo "################################################################"

sudo yum update -y

sudo yum install epel-release -y

sudo yum install monit -y

systemctl enable monit

sudo service monit start
