#!/bin/bash
if [[ $USER != root ]]; then
echo -e "\e[00;31mERROR: must be root\e[00m"
exit 1
fid-apt-repository -y ppa:xubuntu-dev/xfce-4.10
apt -q update
apt -y install xubuntu-desktop xfce4-composite-editor xfce-theme-manager xfce4-power-manager-plugins
apt-get clean
clear
echo -e "\e[00;1;92mFinished...\e[00m"
exit 0
