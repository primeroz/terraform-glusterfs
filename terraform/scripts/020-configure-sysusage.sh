yum -y install sysstat sysusage thttpd

cat > /etc/cron.d/sysusage << EOF
* * * * *    root    /usr/bin/sysusage      >/dev/null 2>&1
*/5 * * * *    root    /usr/bin/sysusagejqgraph >/dev/null 2>&1
EOF

cat > /usr/local/bin/memcommitted.sh << EOF
#!/bin/bash

sar -r | tail -n 2 | grep -v Average | awk '{print \$(NF-1)" "\$NF" 0"}'
EOF

chmod a+x /usr/local/bin/memcommitted.sh

if ! ( egrep -q memcommitted.sh /etc/sysusage.cfg ); then

cat >> /etc/sysusage.cfg << EOF


[PLUGIN memcommitted]
title:Memory committed
menu:Memory
enable:yes
program:/usr/local/bin/memcommitted.sh
minThreshold:
maxThreshold:
delayThreshold:
verticallabel:Memory Committed kb
label1:sar -r kbcommitted
label2:sar -r kbcommitted%
label3:
legend1:kb
legend2:%
legend3:
remote:no
EOF

fi

sed -i -e 's;dir.*;dir=/var/www/sysusage;' /etc/thttpd.conf

service thttpd start
chkconfig thttpd on

