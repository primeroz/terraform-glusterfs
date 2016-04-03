#!/bin/bash

mkdir -p /bricks/{01,02,03,04}

# EBS - xvdh - BRICK1
if [ -e /dev/xvdh ]; then
	mkfs.xfs -L Brick1 /dev/xvdh
	mount -o defaults,noatime,nodiratime,inode64 /dev/xvdh /bricks/01
fi

yum install glusterfs-{client,server} -y

modprobe fuse

chkconfig glusterd on
chkconfig glusterfsd on

service glusterd start

