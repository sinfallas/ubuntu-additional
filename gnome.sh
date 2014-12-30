#!/bin/bash
if [ $USER != root ]; then
echo "Error: run as root"
exit 1
fi
apt -q update
apt -y install gnome-session-fallback gnome gnome-tweak-tool
apt-get clean
clear
echo "Finalizado..."
exit 0
