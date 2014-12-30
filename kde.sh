#!/bin/bash
if [ $USER != root ]; then
echo "Error: run as root"
exit 1
fi
add-apt-repository -y ppa:kubuntu-ppa/backports
apt -q update
apt -y install kubuntu-desktop kubuntu-low-fat-settings kubuntu-restricted-extras
apt-get clean
clear
echo "Finalizado..."
exit 0
