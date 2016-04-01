#!/bin/bash

mkdir -p /mnt/gluster/test1

yum install glusterfs-client -y

modprobe fuse

mount -t glusterfs gluster01:/test1 /mnt/gluster/test1
