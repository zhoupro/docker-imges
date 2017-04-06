#!/usr/bin/env bash

# make the Dockerfile

version=$(whiptail --title "please chose your php version" --radiolist \
	"which php do you install?" 15 60 4 \
	"1" "php5.3.29" ON \
	"2" "php5.6.30" OFF \
	"3" "php7.1.3" OFF \
	 3>&1 1>&2 2>&3)
 
exitstatus=$?
if [ $exitstatus = 0 ]; then
	echo "The chosen php version is:" $version
	sed -i 's,-p . -d,-p '$version' -d,g'   ./Dockerfile
else
	echo "You chose Cancel."
fi
