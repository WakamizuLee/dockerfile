#!/bin/bash

mysql_install_db --user=mysql
sleep 3

mysqld_safe &
sleep 3

mysql -e "create database wordpress;grant all on wordpress.* to 'wakamizu'@'localhost' identified by 'wakamizu';"

mysql -e "use mysql; grant all privileges on *.* to '$MARIADB_USER'@'%' identified by '$MARIADB_PASS' with grant option;"


mysql -e "use mysql; update user set password=password('$MARIADB_PASS') where user='$MARIADB_USER';"



mysql -e "flush privileges;"
