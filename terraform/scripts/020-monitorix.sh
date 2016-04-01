#!/bin/bash

yum -y install rrdtool rrdtool-perl perl-libwww-perl perl-MailTools perl-MIME-Lite perl-CGI perl-DBI perl-XML-Simple perl-Config-General perl-HTTP-Server-Simple perl-IO-Socket-SSL

wget http://www.monitorix.org/monitorix-3.8.1-1.noarch.rpm

yum -y update
yum -y install monitorix

service monitorix start
chkconfig monitorix on
