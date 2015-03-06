#!/bin/bash
if [[ $USER != root ]]; then
echo -e "\e[00;31mERROR: must be root\e[00m"
exit 1
fi
apt -q update
apt -y install pigz rar p7zip-full unace p7zip-rar sharutils mpack arj atool lzop
apt-get clean
clear
echo -e "\e[00;1;92mFinished...\e[00m"
exit 0
