#!/bin/bash

yum -y install sysbench

mkdir -p /mnt/gluster/test1/sysbench

cd /mnt/gluster/test1/sysbench
nohup sysbench --test=fileio --file-total-size=8G prepare 2>&1 >/dev/null &

cat > /etc/cron.d/sysbench << EOF
00 * * * * root cd /mnt/gluster/test1/sysbench && sysbench --test=fileio --file-total-size=8G --file-test-mode=seqrd --max-time=300 run
05 * * * * root cd /mnt/gluster/test1/sysbench && sysbench --test=fileio --file-total-size=8G --file-test-mode=seqwr --max-time=300 run
10 * * * * root cd /mnt/gluster/test1/sysbench && sysbench --test=fileio --file-total-size=8G --file-test-mode=seqrewr --max-time=300 run
40 * * * * root cd /mnt/gluster/test1/sysbench && sysbench --test=fileio --file-total-size=8G --file-test-mode=rndrd --max-time=300 run
45 * * * * root cd /mnt/gluster/test1/sysbench && sysbench --test=fileio --file-total-size=8G --file-test-mode=rndwr --max-time=300 run
50 * * * * root cd /mnt/gluster/test1/sysbench && sysbench --test=fileio --file-total-size=8G --file-test-mode=rndrw --max-time=300 run
EOF

