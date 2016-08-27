#!/bin/bash

REGION="us-west-2"
CONFIG="https://raw.githubusercontent.com/sjafferali/cloudwatch-logs/master/awslogs.conf"

python <(curl -s https://s3.amazonaws.com/aws-cloudwatch/downloads/latest/awslogs-agent-setup.py) -r $REGION -c $CONFIG --non-interactive

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

chkconfig awslogs on
/etc/init.d/awslogs start
