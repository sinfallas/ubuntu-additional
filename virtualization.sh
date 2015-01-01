#!/bin/bash
if [ $USER != root ]; then
echo "Error: run as root"
exit 1
fi
nombre=$(whoami)
casa=/home/$nombre
kvmdir=$casa/kvm
apt -q update
apt -y install linux-lowlatency apparmor-utils qemu qemu-kvm qemu-kvm-spice grub-firmware-qemu qemu-system qemu-user qemuctl vde2 spice-client-gtk python-spice-client-gtk virt-manager virt-goodies virt-viewer bridge-utils
apt-get clean
# virtualbox
addgroup vboxusers
adduser $nombre vboxusers
/etc/init.d/vboxdrv setup

# kvm
addgroup kvm
adduser $nombre kvm
addgroup vde2-net
adduser $nombre vde2-net
mkdir -p $casa/isos
mkdir -p $casa/kvm
mkdir -p $casa/kvm/vde
mkdir -p /var/lib/libvirt/images/nas
setcap cap_net_admin=ei /usr/bin/qemu-system-x86_64
echo cap_net_admin $nombre >> /etc/security/capability.conf
sed -i 's/VHOST_NET_ENABLED=0/VHOST_NET_ENABLED=1/g' /etc/default/qemu-kvm
echo "printf '54:52:00:%02X:%02X:%02X\n' $((RANDOM%256)) $((RANDOM%256)) $((RANDOM%256))" >> $kvmdir/kvmgenmac
chmod -v +x $kvmdir/kvmgenmac
clear
echo "Finalizado..."
exit 0
