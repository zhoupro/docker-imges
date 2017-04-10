#!/usr/bin/env bash

mkdir -p /data/www/wwwroot 
cd /data/www/wwwroot
/data/server/nginx/sbin/nginx
touch /data/log/nginx/error.log
tail -f /data/log/nginx/error.log
