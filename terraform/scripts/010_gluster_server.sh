#!/bin/bash

mkdir -p /bricks/{01,02,03,04}
# MOOUNT SOME EBS HERE? 

yum install glusterfs-{client,server} -y

modprobe fuse

chkconfig glusterd on
chkconfig glusterfsd on

service glusterd start

