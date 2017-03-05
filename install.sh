#!/bin/bash

REGION="us-east-1"
CONFIG="https://raw.githubusercontent.com/sjafferali/cloudwatch-logs/master/awslogs.conf"

python <(curl -s https://raw.githubusercontent.com/sjafferali/cloudwatch-logs/master/awslogs-agent-setup.py) -r $REGION -c $CONFIG --non-interactive

wget -P /var/awslogs/etc/config/ https://raw.githubusercontent.com/sjafferali/cloudwatch-logs/master/config/comon

if [[ -f /var/log/holland/holland.log ]]
then
  wget -P /var/awslogs/etc/config/ https://raw.githubusercontent.com/sjafferali/cloudwatch-logs/master/config/holland
fi

if [[ -f /var/log/mariadb/mariadb.log ]]
then
  wget -P /var/awslogs/etc/config/ https://raw.githubusercontent.com/sjafferali/cloudwatch-logs/master/config/mariadb
fi

if [[ -f /var/log/mysqld.log ]]
then
  wget -P /var/awslogs/etc/config/ https://raw.githubusercontent.com/sjafferali/cloudwatch-logs/master/config/mysql
fi

if [[ -f /var/log/nginx/access.log ]]
then
  wget -P /var/awslogs/etc/config/ https://raw.githubusercontent.com/sjafferali/cloudwatch-logs/master/config/nginx
fi

if [[ -f /var/log/php-fpm/error.log ]]
then
  wget -P /var/awslogs/etc/config/ https://raw.githubusercontent.com/sjafferali/cloudwatch-logs/master/config/phpfpm
fi

if [[ -f /var/log/redis/redis.log ]]
then
  wget -P /var/awslogs/etc/config/ https://raw.githubusercontent.com/sjafferali/cloudwatch-logs/master/config/redis
fi

if [[ -f /var/log/gunicorn/access_log ]]
then
  wget -P /var/awslogs/etc/config/ https://raw.githubusercontent.com/sjafferali/cloudwatch-logs/master/config/gunicorn
fi

if [[ -f /opt/backupdir/logs/fs.log ]]
then
  wget -P /var/awslogs/etc/config/ https://raw.githubusercontent.com/sjafferali/cloudwatch-logs/master/config/backup-fs
fi

if [[ -f /var/log/httpd/error_log ]]
then
  wget -P /var/awslogs/etc/config/ https://raw.githubusercontent.com/sjafferali/cloudwatch-logs/master/config/httpd
fi

if [[ -f /usr/local/prm/logs/kill.log ]]
then
  wget -P /var/awslogs/etc/config/ https://raw.githubusercontent.com/sjafferali/cloudwatch-logs/master/config/prm
fi

if [[ -f /opt/sandbox-toolkit/logs/api.log ]]
then
  wget -P /var/awslogs/etc/config/ https://raw.githubusercontent.com/sjafferali/cloudwatch-logs/master/config/web-api
fi

systemctl enable awslogs
systemctl restart awslogs
