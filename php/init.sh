#!/usr/bin/env bash

mkdir -p /data/www/wwwroot 
cd /data/www/wwwroot
/data/server/php/sbin/php-fpm
mkdir -p /data/server/php/var/log/
touch /data/server/php/var/log/php-fpm.log
tail -f /data/server/php/var/log/php-fpm.log
