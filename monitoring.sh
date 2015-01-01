#!/bin/bash
if [ $USER != root ]; then
echo "Error: run as root"
exit 1
fi
apt -q update
apt -y install htop iotop iftop powertop jupiter lm-sensors hddtemp indicator-sensors
apt-get clean
clear
echo "Finalizado..."
exit 0
