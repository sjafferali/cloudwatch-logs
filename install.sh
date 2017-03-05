#!/bin/bash

if [[ ! -d "/var/awslogs" ]]
then
    REGION="us-east-1"
    CONFIG="https://raw.githubusercontent.com/sjafferali/cloudwatch-logs/master/awslogs.conf"
    python <(curl -s https://raw.githubusercontent.com/sjafferali/cloudwatch-logs/master/awslogs-agent-setup.py) -r $REGION -c $CONFIG --non-interactive
fi

wget -O /var/awslogs/etc/config/comon https://raw.githubusercontent.com/sjafferali/cloudwatch-logs/master/config/comon

if [[ -f /var/log/holland/holland.log ]]
then
  wget -O /var/awslogs/etc/config/holland https://raw.githubusercontent.com/sjafferali/cloudwatch-logs/master/config/holland
fi

if [[ -f /var/log/mariadb/mariadb.log ]]
then
  wget -O /var/awslogs/etc/config/mariadb https://raw.githubusercontent.com/sjafferali/cloudwatch-logs/master/config/mariadb
fi

if [[ -f /var/log/mysqld.log ]]
then
  wget -O /var/awslogs/etc/config/mysql https://raw.githubusercontent.com/sjafferali/cloudwatch-logs/master/config/mysql
fi

if [[ -f /var/log/nginx/access.log ]]
then
  wget -O /var/awslogs/etc/config/nginx https://raw.githubusercontent.com/sjafferali/cloudwatch-logs/master/config/nginx
fi

if [[ -f /var/log/php-fpm/error.log ]]
then
  wget -O /var/awslogs/etc/config/phpfpm https://raw.githubusercontent.com/sjafferali/cloudwatch-logs/master/config/phpfpm
fi

if [[ -f /var/log/redis/redis.log ]]
then
  wget -O /var/awslogs/etc/config/redis https://raw.githubusercontent.com/sjafferali/cloudwatch-logs/master/config/redis
fi

if [[ -f /var/log/gunicorn/access_log ]]
then
  wget -O /var/awslogs/etc/config/gunicorn https://raw.githubusercontent.com/sjafferali/cloudwatch-logs/master/config/gunicorn
fi

if [[ -f /opt/backupdir/logs/fs.log ]]
then
  wget -O /var/awslogs/etc/config/backup-fs https://raw.githubusercontent.com/sjafferali/cloudwatch-logs/master/config/backup-fs
fi

if [[ -f /var/log/httpd/error_log ]]
then
  wget -O /var/awslogs/etc/config/httpd https://raw.githubusercontent.com/sjafferali/cloudwatch-logs/master/config/httpd
fi

if [[ -f /usr/local/prm/logs/kill.log ]]
then
  wget -O /var/awslogs/etc/config/prm https://raw.githubusercontent.com/sjafferali/cloudwatch-logs/master/config/prm
fi

if [[ -f /opt/sandbox-toolkit/logs/api.log ]]
then
  wget -O /var/awslogs/etc/config/web-api https://raw.githubusercontent.com/sjafferali/cloudwatch-logs/master/config/web-api
fi

systemctl enable awslogs
systemctl restart awslogs
