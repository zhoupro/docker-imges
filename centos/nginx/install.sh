#!/usr/bin/env bash

# make the Dockerfile

version=$(whiptail --title "please chose your nginx version" --radiolist \
	"which nginx do you install?" 15 60 4 \
	"1" "nginx-1.4.4" ON \
	 3>&1 1>&2 2>&3)
 
exitstatus=$?
if [ $exitstatus = 0 ]; then
	echo "The chosen nginx version is:" $version
	sed -i 's,-n . -d,-n '$version' -d,g'   ./Dockerfile
else
	echo "You chose Cancel."
fi
