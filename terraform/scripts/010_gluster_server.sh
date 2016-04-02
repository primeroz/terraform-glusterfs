#!/bin/bash

mkdir -p /bricks/{01,02,03,04}

# EBS - xvdh - BRICK1
if [ -e /dev/xvdh ]; then
	mkfs.ext4 -L Brick1 /dev/xvdh
	mount /dev/xvdh /bricks/01
fi

yum install glusterfs-{client,server} -y

modprobe fuse

chkconfig glusterd on
chkconfig glusterfsd on

service glusterd start

