#!/bin/sh

set -e

MARIADB_SETUP_FILE=/var/lib/mysql/.setup

service mysql start

if [ ! -e $MARIADB_SETUP_FILE ]; then # 처음에만 실행되도록 하기 위해서

	# mysql -e : mysql 에서 명령을 실행하라는 의미
	
	mysql -e "CREATE DATABASE IF NOT EXISTS $MARIADB_DATABASE";
	mysql -e "CREATE USER IF NOT EXISTS '$MARIADB_USER'@'%' IDENTIFIED BY '$MARIADB_PASSWORD'";
	mysql -e "GRANT ALL PRIVILEGES ON $MARIADB_DATABASE.* TO '$MARIADB_USER'@'%'";
	# 변경사항을 적용하라는 의미
	mysql -e "FLUSH PRIVILEGES";
	# root 계정의 비밀번호를 변경한다.
	mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '$MARIADB_ROOT_PASSWORD'";

	# mysql $MARIADB_DATABASE -uroot -p$MARIADB_ROOT_PASSWORD
	mysqladmin -uroot -p$MARIADB_ROOT_PASSWORD shutdown

	touch $MARIADB_SETUP_FILE
fi

exec mysqld_safe
