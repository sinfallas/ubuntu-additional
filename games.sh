#!/bin/bash
if [ $USER != root ]; then
echo "Error: debes ser root"
exit 1
fi
nombre=$(whoami)
casa=/home/$nombre
echo export WINEARCH=win32 >> $casa/.bashrc
add-apt-repository -y ppa:widelands-dev/widelands-daily
echo 'deb http://download.opensuse.org/repositories/home:klaussfreire:debian/xUbuntu_12.04/ /' >> /etc/apt/sources.list.d/vegastrike-data.list
apt -q update
apt -y install widelands vegastrike-data 0ad freeciv-client-gtk freeciv-server asylum xmoto warzone2100 fretsonfire scorched3d warmux quake quake2 quake3 extremetuxracer alien-arena wesnoth nexuiz widelands tuxfootball trophy triplea trigger-rally supertux supertuxkart torcs robocode realtimebattle pianobooster opencity openarena colobot bzflag assaultcube playonlinux dosbox freeciv-client-gtk fceux curl pcsxr mupen64plus mupen64plus-extraplugins cutemupen
mkdir -p $casa/.dosbox
sed -i 's/output=surface/output=overlay/g' $casa/.dosbox/dosbox-0.74.conf
sed -i 's/sensitivity=100/sensitivity=15/g' $casa/.dosbox/dosbox-0.74.conf
sed -i 's/language=/language=spanish-0.74.lang/g' $casa/.dosbox/dosbox-0.74.conf
sed -i 's/memsize=16/memsize=63/g' $casa/.dosbox/dosbox-0.74.conf
sed -i 's/prebuffer=20/prebuffer=50/g' $casa/.dosbox/dosbox-0.74.conf
sed -i 's/oplemu=default/oplemu=fast/g' $casa/.dosbox/dosbox-0.74.conf
sed -i 's/serial1=dummy/serial1=disabled/g' $casa/.dosbox/dosbox-0.74.conf
sed -i 's/serial2=dummy/serial2=disabled/g' $casa/.dosbox/dosbox-0.74.conf
sed -i 's/keyboardlayout=auto/keyboardlayout=es/g' $casa/.dosbox/dosbox-0.74.conf
echo -e "mount c $casa/Dropbox/dosbox""\n""c:""\n""cls" >> $casa/.dosbox/dosbox-0.74.conf
apt-get clean
clear
echo "Finalizado..."
exit 0
