#!/bin/bash
if [ $USER != root ]; then
echo "Error: run as root"
exit 1
fi
add-apt-repository -y ppa:lubuntu-dev/staging
apt -q update
apt -y install lubuntu-desktop openbox openbox-xdgmenu compton nitrogen tint2 obconf obmenu rxvt-unicode menulibre hal hal-info halevt
echo "@compton --config /home/$nombre/.config/compton.conf -b" >> /etc/xdg/lxsession/Lubuntu/autostart
echo -e "thunar --daemon &""\n""nitrogen --restore &""\n""tint2 &""\n""compton --config /home/$nombre/.config/compton.conf -b &" >> $casa/.config/openbox/autostart
apt-get clean
clear
echo "Finalizado..."
exit 0
