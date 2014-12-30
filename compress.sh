#!/bin/bash
if [ $USER != root ]; then
echo "Error: run as root"
exit 1
fi
apt -q update
apt -y install pigz rar p7zip-full unace p7zip-rar sharutils mpack lha arj atool lzop
apt-get clean
clear
echo "Finalizado..."
exit 0
