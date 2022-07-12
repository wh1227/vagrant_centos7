#!/bin/bash
	sudo yum -y update
#Apache
	sudo yum -y update httpd 
	sudo yum -y install httpd 
	sudo systemctl enable httpd
	sudo systemctl start httpd
	sudo systemctl status httpd

#MariaDB
	sudo yum remove mariadb-server mariadb-libs -y
	sudo tee /etc/yum.repos.d/MariaDB.repo<<EOF
[mariadb]
name = MariaDB
baseurl = http://yum.mariadb.org/10.4/centos7-amd64
gpgkey = https://yum.mariadb.org/RPM-GPG-KEY-MariaDB
gpgcheck=1
EOF
	sudo yum makecache fast
	sudo yum -y install mariadb-server
	sudo systemctl enable --now mariadb
	sudo systemctl status mariadb
