#!/bin/bash

yum -y install wget
#Install Epel
yum  -y install https://dl.fedoraproject.org/pub/epel/6/x86_64/epel-release-${EPEL_VERSION}.noarch.rpm
#Install gluster-fs 
wget http://download.gluster.org/pub/gluster/glusterfs/${GLUSTER_VERSION}/${GLUSTER_PATCH_VERSION}/EPEL.repo/glusterfs-epel.repo
mv glusterfs-epel.repo /etc/yum.repos.d/
# update Repos and Packages
yum -y update

yum -y install vim git augeas sysstat

# Stop IPTABLES. we are using security groups
service iptables stop
chkconfig iptables off

# Setup HOSTS file
egrep -q ${GLUSTER_CLIENT_PRIVATE_IP} /etc/hosts || echo "${GLUSTER_CLIENT_PRIVATE_IP} gluster-client" >> /etc/hosts
egrep -q ${GLUSTER_01_PRIVATE_IP} /etc/hosts || echo "${GLUSTER_01_PRIVATE_IP} gluster01" >> /etc/hosts
egrep -q ${GLUSTER_02_PRIVATE_IP} /etc/hosts || echo "${GLUSTER_02_PRIVATE_IP} gluster02" >> /etc/hosts


