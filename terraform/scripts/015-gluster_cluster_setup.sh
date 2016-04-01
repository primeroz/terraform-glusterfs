#!/bin/bash
set -x

# This will only run on gluster01

gluster peer probe gluster02

gluster volume create test1 replica 2 transport tcp gluster01:/bricks/01 gluster02:/bricks/01 force

gluster status test1
