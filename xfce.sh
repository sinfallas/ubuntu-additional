#!/bin/bash
if [ $USER != root ]; then
echo "Error: run as root"
exit 1
fi
add-apt-repository -y ppa:xubuntu-dev/xfce-4.10
apt -q update
apt -y install xubuntu-desktop xfce4-composite-editor xfce-theme-manager xfce4-power-manager-plugins
apt-get clean
clear
echo "Finalizado..."
exit 0
