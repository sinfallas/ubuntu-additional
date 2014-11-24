#!/bin/bash
if [ $USER != root ]; then
echo "Error: debes ser root"
exit 1
fi
add-apt-repository -y ppa:widelands-dev/widelands-daily
echo 'deb http://download.opensuse.org/repositories/home:klaussfreire:debian/xUbuntu_12.04/ /' >> /etc/apt/sources.list.d/vegastrike-data.list
apt update
apt -y install widelands vegastrike-data
exit 0
