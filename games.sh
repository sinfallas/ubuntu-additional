#!/bin/bash
if [ $USER != root ]; then
echo "Error: debes ser root"
exit 1
fi
add-apt-repository -y ppa:widelands-dev/widelands-daily
echo 'deb http://download.opensuse.org/repositories/home:klaussfreire:debian/xUbuntu_12.04/ /' >> /etc/apt/sources.list.d/vegastrike-data.list
apt -q update
apt -y install widelands vegastrike-data 0ad freeciv-client-gtk freeciv-server asylum xmoto warzone2100 fretsonfire scorched3d warmux quake quake2 quake3 extremetuxracer alien-arena wesnoth nexuiz widelands tuxfootball trophy triplea trigger-rally supertux supertuxkart torcs robocode realtimebattle pianobooster opencity openarena colobot bzflag assaultcube
apt-get clean
exit 0
