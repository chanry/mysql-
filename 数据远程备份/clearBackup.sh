#!/bin/sh
#Function:mysql database backup
#Author:Debris
#date:2017年1月22日
#Setting
LogFile1=/var/log/mysqlback.log

echo "#############start clear*************" \ >>$LogFile1
echo "---------------$(date '+%y%m%d%H%M%S')-----------------" \ >> $LogFile1
#删除最近10分钟被读取的sql文件
find /mysql_bak/*.sql -amin +2 -exec rm -f {} \;

echo "#############end clear*************" \ >>$LogFile1
echo "---------------$(date '+%y%m%d%H%M%S')-----------------" \ >> $LogFile1

