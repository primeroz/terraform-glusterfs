#!/bin/bash

yum -y install wget
#Install Epel
yum  -y install https://dl.fedoraproject.org/pub/epel/6/x86_64/epel-release-${EPEL_VERSION}.noarch.rpm
#Install gluster-fs 
wget http://download.gluster.org/pub/gluster/glusterfs/${GLUSTER_VERSION}/LATEST/EPEL.repo/glusterfs-epel.repo
mv glusterfs-epel.repo /etc/yum.repos.d/
# update Repos and Packages
yum -y update

yum -y install vim git augeas sysstat iftop htop zsh tree iotop dstat xfsprogs

# Run sysstat every 5 mins
sed -i -e 's;^\*/10.*/usr/lib64/sa/sa1.*;*/5 * * * * root /usr/lib64/sa/sa1 1 1;' /etc/cron.d/sysstat

# Stop IPTABLES. we are using security groups
service iptables stop
chkconfig iptables off

# Setup HOSTS file
egrep -q ${GLUSTER_CLIENT_PRIVATE_IP} /etc/hosts || echo "${GLUSTER_CLIENT_PRIVATE_IP} gluster-client" >> /etc/hosts
egrep -q ${GLUSTER_01_PRIVATE_IP} /etc/hosts || echo "${GLUSTER_01_PRIVATE_IP} gluster01" >> /etc/hosts
egrep -q ${GLUSTER_02_PRIVATE_IP} /etc/hosts || echo "${GLUSTER_02_PRIVATE_IP} gluster02" >> /etc/hosts


