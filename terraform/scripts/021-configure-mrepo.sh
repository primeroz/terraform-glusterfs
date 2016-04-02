#!/bin/bash

yum -y install mrepo createrepo lftp

mkdir -p /mnt/gluster/test1/mrepo/{src,www}

sed -i -e 's/srcdir.*/srcdir=\/mnt\/gluster\/test1\/src/' /etc/mrepo.conf
sed -i -e 's/wwwdir.*/wwwdir=\/mnt\/gluster\/test1\/www/' /etc/mrepo.conf

sed -i -e 's;.*/usr/bin/mrepo.*;30 */4 * * * root /usr/bin/mrepo -q -ug;' /etc/cron.d/mrepo

mv /tmp/config/mrepo-centos6.conf /etc/mrepo.conf.d/centos6.conf
