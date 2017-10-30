#!/bin/sh
#Function:mysql database backup
#Author:Debris
#date:2017年1月22日
#Setting
Backup=/mysql_bak/
LogFile1=/var/log/mysqlback.log
DBName=test
DBUser=root
DBPasswd=trsadmin
filename=test_$(date '+%y%m%d%H%M%S')

echo "###############Start packing################" \ >> $LogFile1
echo "---------------$(date '+%y%m%d%H%M%S')-----------------" \ >> $LogFile1
echo "--------------------------------------------" \ >> $LogFile1
/usr/bin/mysqldump --single-transaction --quick --skip-lock-tables --user=$DBUser --password=$DBPasswd --databases $DBName > $Backup/$filename.sql
echo "###############Backup Success!################" \ >> $LogFile1
echo "---------------$(date '+%y%m%d%H%M%S')-----------------" \ >> $LogFile1
echo "--------------------------------------------" \ >> $LogFile1

scp /mysql_bak/$filename.sql root@192.168.16.178:/mysql_bak

#7天循环删除
find /mysql_bak/*.sql -amin +10 -exec rm -f {} \;

