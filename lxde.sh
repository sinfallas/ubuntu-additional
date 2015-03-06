#!/bin/bash
if [[ $USER != root ]]; then
echo -e "\e[00;31mERROR: must be root\e[00m"
exit 1
fi
add-apt-repository -y ppa:lubuntu-dev/staging
apt -q update
apt -y install lubuntu-desktop openbox openbox-xdgmenu compton nitrogen tint2 obconf obmenu rxvt-unicode menulibre hal hal-info halevt
echo "@compton --config /home/$nombre/.config/compton.conf -b" >> /etc/xdg/lxsession/Lubuntu/autostart
echo -e "thunar --daemon &""\n""nitrogen --restore &""\n""tint2 &""\n""compton --config /home/$nombre/.config/compton.conf -b &" >> $casa/.config/openbox/autostart
apt-get clean
clear
echo -e "\e[00;1;92mFinished...\e[00m"
exit 0
