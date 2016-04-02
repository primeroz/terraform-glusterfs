#!/bin/bash
set -e

# This will only run on gluster01

if ! (gluster peer status | egrep -q gluster02); then
	gluster peer probe gluster02
	sleep 5
fi

if ! (gluster volume list | egrep -q test1); then
	gluster volume create test1 replica 2 transport tcp gluster01:/bricks/01 gluster02:/bricks/01 force
fi

sleep 2
gluster volume start test1 2>&1 >/dev/null || true

gluster volume status test1
