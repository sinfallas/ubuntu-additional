#!/bin/bash
if [ $USER != root ]; then
echo "Error: run as root"
exit 0
fi
nombre=$(whoami)
casa=/home/$nombre
update-pciids
update-usbids
echo -e "net.ipv6.conf.all.disable_ipv6 = 1""\n""net.ipv6.conf.default.disable_ipv6 = 1""\n""net.ipv6.conf.lo.disable_ipv6 = 1" >> /etc/sysctl.d/60-disableipv6.conf
start procps
echo -e 'Section "Device"'"\n"' Identifier "intel"'"\n"' Driver "intel"'"\n"'BusID 	"PCI:0:2:0"'"\n"' Option "AccelMethod" "SNA"'"\n"' Option "SwapbuffersWait" "false"'"\n"' Option "Tiling" "true"'"\n"' Option "BackingStore" "True"'"\n"' Option "XvMC" "on"'"\n"' Option "TripleBuffer" "true"'"\n"' Option "DRI" "true"'"\n"'EndSection' >> /etc/X11/xorg.conf
echo -e "vm.swappiness = 10""\n""vm.dirty_background_ratio = 15""\n""vm.dirty_ratio = 25""\n""vm.vfs_cache_pressure = 50""\n""vm.dirty_writeback_centisecs = 1500""\n""vm.mmap_min_addr = 4096""\n""kernel.shmmni = 4096""\n""kernel.shmall = 2097152""\n""kernel.shmmax = 536870912""\n""kernel.threads-max = 98006""\n""net.ipv6.conf.all.disable_ipv6 = 1""\n""net.ipv6.conf.default.disable_ipv6 = 1""\n""net.ipv6.conf.lo.disable_ipv6 = 1""\n""net.ipv6.conf.all.accept_redirects = 0""\n""net.ipv6.conf.all.accept_source_route = 0""\n""net.ipv4.conf.default.rp_filter=1""\n""net.ipv4.conf.all.rp_filter=1""\n""net.ipv4.conf.all.accept_redirects = 0""\n""net.ipv4.conf.all.send_redirects = 0""\n""net.ipv4.conf.all.accept_source_route = 0""\n""net.ipv4.tcp_timestamps = 1""\n""net.ipv4.tcp_sack = 1""\n""net.ipv4.tcp_window_scaling = 1""\n""net.core.rmem_max = 16777216""\n""net.core.wmem_max = 16777216""\n""net.ipv4.tcp_rmem = 4096 87380 16777216""\n""net.ipv4.tcp_wmem = 4096 65536 16777216""\n""net.ipv4.tcp_no_metrics_save = 1""\n""net.core.netdev_max_backlog = 2500""\n""fs.file-max = 307615""\n""fs.aio-max-nr = 1048576""\n""net.ipv4.tcp_moderate_rcvbuf = 1""\n""net.ipv4.tcp_syncookies=1""\n""# kernel.kptr_restrict = 1""\n""fs.file-max = 307615""\n""fs.aio-max-nr = 1048576" >> /etc/sysctl.conf
sysctl -p
echo "* hard nproc 1000" >> /etc/security/limits.conf
echo -e "/dev/sda {""\n"" lookahead = on""\n"" write_cache = on""\n"" spindown_time = 18""\n""}" >> /etc/hdparm.conf
echo "tmpfs /tmp tmpfs noexec,nosuid,noatime,nodev 0 0" >> /etc/fstab
echo "tmpfs /var/cache/apt/archives tmpfs noatime,nodev 0 0" >> /etc/fstab
echo "tmpfs /var/cache/samba tmpfs noatime,nodev 0 0" >> /etc/fstab
echo "tmpfs /var/log tmpfs noatime,nodev 0 0" >> /etc/fstab
echo "tmpfs /var/spool tmpfs noatime,nodev 0 0" >> /etc/fstab
echo "tmpfs /var/tmp tmpfs noexec,nosuid,noatime,nodev 0 0" >> /etc/fstab
echo 'INTEL_BATCH="1"' >> /etc/environment
echo "options rtl8192ce ips=0 swenc=1 fwlps=0 swlps=0" >> /etc/modprobe.d/rtl8192ce.conf
sed -i 's/GRUB_CMDLINE_LINUX_DEFAULT="quiet splash"/GRUB_CMDLINE_LINUX_DEFAULT="elevator=deadline drm.vblankoffdelay=1 i915.i915_enable_fbc=1 i915.i915_enable_rc6=1 i915.lvds_downclock=1 nordrand panic=10 quiet splash"/g' /etc/default/grub
update-grub2
sed -i 's/127.0.0.1	localhost/127.0.0.1	localhost $(hostname)/g' /etc/hosts
echo -e "[Re-enable hibernate by default]""\n""Identity=unix-user:*""\n""Action=org.freedesktop.upower.hibernate""\n""ResultActive=yes" >> /etc/polkit-1/localauthority/50-local.d/com.ubuntu.desktop.pkla
cd /etc/xdg/autostart/
sed --in-place 's/NoDisplay=true/NoDisplay=false/g' *.desktop
cd $casa

# repositorios
add-apt-repository -y ppa:xorg-edgers/ppa
add-apt-repository -y ppa:glasen/intel-driver
add-apt-repository -y ppa:jacob/virtualisation
add-apt-repository -y ppa:libreoffice/ppa
add-apt-repository -y ppa:ubuntu-wine/ppa
add-apt-repository -y ppa:otto-kesselgulasch/gimp
add-apt-repository -y ppa:pmjdebruijn/darktable-release-plus
add-apt-repository -y ppa:danielrichter2007/grub-customizer
add-apt-repository -y ppa:nilarimogard/webupd8
add-apt-repository -y ppa:tualatrix/ppa
add-apt-repository -y ppa:webupd8team/unstable
echo "deb http://ppa.launchpad.net/jolicloud-team/ppa/ubuntu raring main" >> /etc/apt/sources.list
add-apt-repository -y ppa:a-v-shkop/chromium
add-apt-repository -y ppa:webupd8team/y-ppa-manager
add-apt-repository -y ppa:ubuntu-mozilla-security/ppa
add-apt-repository -y ppa:thp/gpodder
add-apt-repository -y ppa:n-muench/vlc2
add-apt-repository -y ppa:diesch/testing
add-apt-repository -y ppa:mumble/release
add-apt-repository -y ppa:lubuntu-desktop/ppa
add-apt-repository -y ppa:richardgv/compton
add-apt-repository -y ppa:xubuntu-dev/xfce-4.10
add-apt-repository -y ppa:rebuntu16/other-stuff 
add-apt-repository -y ppa:kubuntu-ppa/backports
add-apt-repository -y ppa:gnome3-team/gnome3
add-apt-repository -y ppa:ricotz/testing
add-apt-repository -y ppa:alexmurray/indicator-sensors-daily
add-apt-repository -y ppa:team-xbmc/ppa
add-apt-repository -y ppa:webupd8team/tor-browser
add-apt-repository -y ppa:vase/ppa
# echo "deb http://download.virtualbox.org/virtualbox/debian trusty contrib" >> /etc/apt/sources.list
echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list
# wget --output-document=/etc/apt/sources.list.d/medibuntu.list http://www.medibuntu.org/sources.list.d/$(lsb_release -cs).list
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - 
# wget -q -O - http://download.virtualbox.org/virtualbox/debian/oracle_vbox.asc | apt-key add -
# wget -q -O - http://deb.playonlinux.com/public.gpg | apt-key add -
# wget http://deb.playonlinux.com/playonlinux_precise.list -O /etc/apt/sources.list.d/playonlinux.list
# apt-get -q update
# apt-get --allow-unauthenticated -y install medibuntu-keyring
apt-get -q update
apt-get -q -f -y --force-yes dist-upgrade

apt-get -q -f -y --force-yes install build-essential linux-generic-lts-saucy-eol-upgrade linux-firmware linux-firmware-nonfree intel-microcode

apt-get -q -f -y --force-yes install ubuntu-restricted-extras non-free-codecs w64codecs pulseaudio-equalizer preload prelink synaptic ppa-purge y-ppa-manager git xterm pv gcp localepurge bum sysv-rc-conf dkms grub-customizer ssh xserver-xephyr bleachbit macchanger grsync dconf-tools ubuntu-tweak gimp gimp-plugin-registry nautilus-image-converter darktable scribus inkscape calibre vlc audacity acetoneiso isomaster pdfedit gnome-sushi lo-menubar nautilus-dropbox google-chrome-stable chromium-browser-l10n google-talkplugin community-themes libdvdread4 filezilla mumble unetbootin tor-browser libreoffice-style-sifr

apt-get -q -f -y --force-yes install pigz rar p7zip-full unace p7zip-rar sharutils mpack lha arj atool lzop

apt-get -q -f -y --force-yes install gsfonts-other t1-xfree86-nonfree ttf-dustin ttf-f500 ttf-isabella ttf-larabie-deco ttf-larabie-straight ttf-larabie-uncommon ttf-staypuft ttf-summersby ttf-ubuntu-title ttf-xfree86-nonfree xfonts-intl-european gsfonts-x11 ttf-bpg-georgian-fonts ttf-sjfonts
fc-cache -f -v

sed -i 's/\#   ForwardX11 no/ForwardX11 yes/g' /etc/ssh/ssh_config
sed -i 's/Port 22/Port 2222/g' /etc/ssh/sshd_config
sed -i 's/LoginGraceTime 120/LoginGraceTime 20/g' /etc/ssh/sshd_config
sed -i 's/PermitRootLogin yes/PermitRootLogin no/g' /etc/ssh/sshd_config
sed -i 's/\#MaxStartups 10:30:60/MaxStartups 2/g' /etc/ssh/sshd_config
echo -e "MaxAuthTries 2""\n""AllowUsers "$nombre"\n""X11UseLocalhost yes""\n""AddressFamily inet""\n""UseDNS no""\n""ClientAliveInterval 60">> /etc/ssh/sshd_config

#unity
apt-get -q -f -y --force-yes install myunity unsettings compizconfig-settings-manager 
#xfce
apt-get -q -f -y --force-yes install xubuntu-desktop xfce4-composite-editor xfce-theme-manager xfce4-power-manager-plugins
#lxde
apt-get -q -f -y --force-yes install lubuntu-desktop openbox openbox-xdgmenu compton nitrogen tint2 obconf obmenu rxvt-unicode menulibre hal hal-info halevt
echo "@compton --config /home/$nombre/.config/compton.conf -b" >> /etc/xdg/lxsession/Lubuntu/autostart
echo -e "thunar --daemon &""\n""nitrogen --restore &""\n""tint2 &""\n""compton --config /home/$nombre/.config/compton.conf -b &" >> $casa/.config/openbox/autostart
#KDE
apt-get -q -f -y --force-yes install kubuntu-desktop kubuntu-low-fat-settings kubuntu-restricted-extras
#gnome
apt-get -q -f -y --force-yes install gnome-session-fallback gnome gnome-tweak-tool
#enlightenment
apt-get -q -f -y --force-yes install enlightenment

apt-get -q -f -y --force-yes install htop iotop iftop powertop jupiter lm-sensors hddtemp indicator-sensors
echo "coretemp" >> /etc/modules

apt-get -q -f -y --force-yes install playonlinux dosbox freeciv-client-gtk fceux curl pcsxr mupen64plus mupen64plus-extraplugins cutemupen
echo export WINEARCH=win32 >> $casa/.bashrc
mkdir -p $casa/.dosbox
sed -i 's/output=surface/output=overlay/g' $casa/.dosbox/dosbox-0.74.conf
sed -i 's/sensitivity=100/sensitivity=15/g' $casa/.dosbox/dosbox-0.74.conf
sed -i 's/language=/language=spanish-0.74.lang/g' $casa/.dosbox/dosbox-0.74.conf
sed -i 's/memsize=16/memsize=63/g' $casa/.dosbox/dosbox-0.74.conf
sed -i 's/prebuffer=20/prebuffer=50/g' $casa/.dosbox/dosbox-0.74.conf
sed -i 's/oplemu=default/oplemu=fast/g' $casa/.dosbox/dosbox-0.74.conf
sed -i 's/serial1=dummy/serial1=disabled/g' $casa/.dosbox/dosbox-0.74.conf
sed -i 's/serial2=dummy/serial2=disabled/g' $casa/.dosbox/dosbox-0.74.conf
sed -i 's/keyboardlayout=auto/keyboardlayout=es/g' $casa/.dosbox/dosbox-0.74.conf
echo -e "mount c $casa/Dropbox/dosbox""\n""c:""\n""cls" >> $casa/.dosbox/dosbox-0.74.conf

apt-get -q -f -y --force-yes install python-software-properties pkg-config software-properties-common xbmc

apt-get -q -f -y --force-yes install linux-lowlatency virtualbox-4.3 apparmor-utils kvm qemu-kvm-extras qemu qemu-kvm qemu-kvm-spice grub-firmware-qemu qemu-system qemu-user qemuctl vde2 spice-client-gtk python-spice-client-gtk virt-manager virt-goodies virt-viewer bridge-utils

# xcp-xapi xen-tools xenwatch openvswitch-switch openvswitch-datapath-source ubuntu-vm-builder randomize-lines uml-utilities socat
#apt-get -s install umview umview-mod-umfuseiso9660 umview-mod-umfuseext2 umview-mod-umlwip umview-mod-umdevtap libiso9660-dev libfuse-dev libpcap-dev

# xen
#sed -i 's/\#\(xend-http-server no\)/\(xend-http-server yes\)/g' /etc/xen/xend-config.sxp
#sed -i 's/\#\(xend-unix-server no\)/\(xend-unix-server yes\)/g' /etc/xen/xend-config.sxp
#sed -i 's/\#\(xend-port            8000\)/\(xend-port            8000\)/g' /etc/xen/xend-config.sxp
#sed -i 's/\#\(network-script network-bridge\)/\(network-script network-bridge\)/g' /etc/xen/xend-config.sxp
#sed -i 's/\#\(logfile \/var\/log\/xen\/xend.log\)/\(logfile \/var\/log\/xen\/xend.log\)/g' /etc/xen/xend-config.sxp
#sed -i 's/\#\(xend-tcp-xmlrpc-server no\)/\(xend-tcp-xmlrpc-server yes\)/g' /etc/xen/xend-config.sxp
#sed -i 's/\#\(xend-tcp-xmlrpc-server-port 8006\)/\(xend-tcp-xmlrpc-server-port 8006\)/g' /etc/xen/xend-config.sxp
#sed -i 's/\#\(xend-unix-xmlrpc-server yes\)/\(xend-unix-xmlrpc-server yes\)/g' /etc/xen/xend-config.sxp
#sed -i 's/\#\(xend-unix-path \/var\/lib\/xend\/xend-socket\)/\(xend-unix-path \/var\/lib\/xend\/xend-socket\)/g' /etc/xen/xend-config.sxp
#sed -i 's/\#\(xend-tcp-xmlrpc-server-address 'localhost'\)/\(xend-tcp-xmlrpc-server-address 'localhost'\)/g' /etc/xen/xend-config.sxp
#addgroup libvirtd
#adduser $nombre libvirtd
#mkdir -p /usr/lib64
#ln -s /usr/lib/xen-4.1 /usr/lib/xen
#ln -s /usr/lib/xen-4.1 /usr/lib64/xen
#echo export VIRSH_DEFAULT_CONNECT_URI=xen:/// >> $casa/.bashrc
#module-assistant auto-install openvswitch-datapath

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

xdg-mime default firefox.desktop x-scheme-handler/http
xdg-mime default firefox.desktop x-scheme-handler/https
echo "alias cp='gcp'" >> $casa/.bashrc
echo "alias cp='gcp'" >> /root/.bashrc
echo "alias update='apt-get update && apt-get -y dist-upgrade'" >> /root/.bashrc
echo "alias subir='git add . && git commit -a && git push --all'" >> $casa/.bashrc
sed -i 's/PRELINKING=unknown/PRELINKING=yes/g' /etc/default/prelink
sed -i 's/PRELINK_OPTS=-mR/PRELINK_OPTS=-amR/g' /etc/default/prelink
prelink -amvR
/etc/cron.daily/prelink
/usr/share/doc/libdvdread4/install-css.sh

apt-get clean
apt-get autoclean
apt-get -y autoremove
clear
echo Finalizado se recomienda reiniciar, elaborado para ubuntu 64 bits por sinfallas.
exit 0
