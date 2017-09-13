#!/bin/bash
#start nginx
/data/server/nginx/nginx

time_file="/tmp/last_time.txt"
touch $time_file
exclude_file="^/data/www/wwwroot/site"
watch_file="/data/www/wwwroot"
change_time=${CHANGE_TIME-20}
echo change_time

# change long 20s will do somethings

inotifywait -qmre attrib,modify,move,create,delete  --format '"%w" "%f" "%e" "%T"' --timefmt='%F_%T' \
--exclude $exclude_file   $watch_file \
| while read DIR FILE EVENT TIME ;do

    STM=`date +%s `
    OLD_STM=$(cat $time_file)
    [ "$OLD_STM" ] || OLD_STM=0
    STEP=$((STM-OLD_STM))
 	if [[ $STEP -gt $change_time ]];then
 	   echo $STM  >$time_file
       cd /data/www/wwwroot && mkdocs build
 	fi
done