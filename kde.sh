#!/bin/bash
if [[ $USER != root ]]; then
echo -e "\e[00;31mERROR: must be root\e[00m"
exit 1
fi
add-apt-repository -y ppa:kubuntu-ppa/backports
apt -q update
apt -y install kubuntu-desktop kubuntu-low-fat-settings kubuntu-restricted-extras
apt-get clean
clear
echo -e "\e[00;1;92mFinished...\e[00m"
exit 0
