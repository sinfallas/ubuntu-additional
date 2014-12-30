#!/bin/bash
if [ $USER != root ]; then
echo "Error: run as root"
exit 1
fi
add-apt-repository -y ppa:libreoffice/ppa
apt -q update
apt -y full-upgrade
apt -y install gsfonts-other t1-xfree86-nonfree ttf-dustin ttf-f500 ttf-isabella ttf-larabie-deco ttf-larabie-straight ttf-larabie-uncommon ttf-staypuft ttf-summersby ttf-ubuntu-title ttf-xfree86-nonfree xfonts-intl-european gsfonts-x11 ttf-bpg-georgian-fonts ttf-sjfonts
fc-cache -f -v
apt-get clean
clear
echo "Finalizado..."
exit 0
