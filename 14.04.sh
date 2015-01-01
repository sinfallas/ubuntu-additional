#!/bin/bash
if [ $USER != root ]; then
echo "Error: run as root"
exit 1
fi
nombre=$(whoami)
casa=/home/$nombre
echo -e "net.ipv6.conf.all.disable_ipv6 = 1""\n""net.ipv6.conf.default.disable_ipv6 = 1""\n""net.ipv6.conf.lo.disable_ipv6 = 1" >> /etc/sysctl.d/60-disableipv6.conf
start procps
echo -e 'Section "Device"'"\n"' Identifier "intel"'"\n"' Driver "intel"'"\n"'BusID 	"PCI:0:2:0"'"\n"' Option "AccelMethod" "SNA"'"\n"' Option "SwapbuffersWait" "false"'"\n"' Option "Tiling" "true"'"\n"' Option "BackingStore" "True"'"\n"' Option "XvMC" "on"'"\n"' Option "TripleBuffer" "true"'"\n"' Option "DRI" "true"'"\n"'EndSection' >> /etc/X11/xorg.conf
echo -e "vm.swappiness = 10""\n""vm.dirty_background_ratio = 15""\n""vm.dirty_ratio = 25""\n""vm.vfs_cache_pressure = 50""\n""vm.dirty_writeback_centisecs = 1500""\n""vm.mmap_min_addr = 4096""\n""kernel.shmmni = 4096""\n""kernel.shmall = 2097152""\n""kernel.shmmax = 536870912""\n""kernel.threads-max = 98006""\n""net.ipv6.conf.all.disable_ipv6 = 1""\n""net.ipv6.conf.default.disable_ipv6 = 1""\n""net.ipv6.conf.lo.disable_ipv6 = 1""\n""net.ipv6.conf.all.accept_redirects = 0""\n""net.ipv6.conf.all.accept_source_route = 0""\n""net.ipv4.conf.default.rp_filter=1""\n""net.ipv4.conf.all.rp_filter=1""\n""net.ipv4.conf.all.accept_redirects = 0""\n""net.ipv4.conf.all.send_redirects = 0""\n""net.ipv4.conf.all.accept_source_route = 0""\n""net.ipv4.tcp_timestamps = 1""\n""net.ipv4.tcp_sack = 1""\n""net.ipv4.tcp_window_scaling = 1""\n""net.core.rmem_max = 16777216""\n""net.core.wmem_max = 16777216""\n""net.ipv4.tcp_rmem = 4096 87380 16777216""\n""net.ipv4.tcp_wmem = 4096 65536 16777216""\n""net.ipv4.tcp_no_metrics_save = 1""\n""net.core.netdev_max_backlog = 2500""\n""fs.file-max = 307615""\n""fs.aio-max-nr = 1048576""\n""net.ipv4.tcp_moderate_rcvbuf = 1""\n""net.ipv4.tcp_syncookies=1""\n""# kernel.kptr_restrict = 1""\n""fs.file-max = 307615""\n""fs.aio-max-nr = 1048576" >> /etc/sysctl.conf
sysctl -p
echo "* hard nproc 1000" >> /etc/security/limits.conf
echo -e "/dev/sda {""\n"" lookahead = on""\n"" write_cache = on""\n"" spindown_time = 18""\n""}" >> /etc/hdparm.conf
echo "tmpfs /tmp tmpfs noexec,sync,nosuid,noatime,nodev 0 0" >> /etc/fstab
echo "tmpfs /var/cache/apt/archives tmpfs noatime,sync,nodev 0 0" >> /etc/fstab
echo "tmpfs /var/cache/samba tmpfs noatime,sync,nodev 0 0" >> /etc/fstab
echo "tmpfs /var/log tmpfs noatime,sync,nodev 0 0" >> /etc/fstab
echo "tmpfs /var/spool tmpfs noatime,sync,nodev 0 0" >> /etc/fstab
echo "tmpfs /var/tmp tmpfs noexec,sync,nosuid,noatime,nodev 0 0" >> /etc/fstab
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
add-apt-repository -y ppa:ubuntu-wine/ppa
add-apt-repository -y ppa:otto-kesselgulasch/gimp
add-apt-repository -y ppa:pmjdebruijn/darktable-release-plus
add-apt-repository -y ppa:danielrichter2007/grub-customizer
add-apt-repository -y ppa:nilarimogard/webupd8
add-apt-repository -y ppa:tualatrix/ppa
add-apt-repository -y ppa:webupd8team/unstable
add-apt-repository -y ppa:a-v-shkop/chromium
add-apt-repository -y ppa:webupd8team/y-ppa-manager
add-apt-repository -y ppa:ubuntu-mozilla-security/ppa
add-apt-repository -y ppa:thp/gpodder
add-apt-repository -y ppa:diesch/testing
add-apt-repository -y ppa:mumble/release
add-apt-repository -y ppa:richardgv/compton
add-apt-repository -y ppa:rebuntu16/other-stuff 
add-apt-repository -y ppa:gnome3-team/gnome3
add-apt-repository -y ppa:ricotz/testing
add-apt-repository -y ppa:alexmurray/indicator-sensors-daily
add-apt-repository -y ppa:webupd8team/tor-browser
add-apt-repository -y ppa:vase/ppa
apt-add-repository -y ppa:gurqn/systray-trusty
add-apt-repository -y ppa:ubuntu-toolchain-r/test
add-apt-repository -y ppa:webupd8team/java
echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list
wget --output-document=/etc/apt/sources.list.d/medibuntu.list http://www.medibuntu.org/sources.list.d/$(lsb_release -cs).list
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - 
echo "deb http://liquorix.net/debian sid main" >> /etc/apt/sources.list
apt-key adv --keyserver keyserver.ubuntu.com --recv-keys A902DDA375E52366
apt update
apt-get --allow-unauthenticated -y install medibuntu-keyring
apt update
apt -y --force-yes full-upgrade

apt -y install build-essential linux-generic-lts-saucy-eol-upgrade linux-firmware linux-firmware-nonfree intel-microcode hwdata

apt -y install ubuntu-restricted-extras non-free-codecs w64codecs pulseaudio-equalizer preload prelink synaptic ppa-purge y-ppa-manager git xterm pv gcp localepurge bum sysv-rc-conf dkms grub-customizer ssh xserver-xephyr bleachbit macchanger grsync dconf-tools ubuntu-tweak gimp gimp-plugin-registry nautilus-image-converter darktable scribus inkscape calibre vlc audacity acetoneiso isomaster pdfedit gnome-sushi nautilus-dropbox google-chrome-stable chromium-browser-l10n google-talkplugin community-themes libdvdread4 filezilla mumble unetbootin libreoffice-l10n-es myspell-es ispanish autojump ttf-ancient-fonts

sed -i 's/\#   ForwardX11 no/ForwardX11 yes/g' /etc/ssh/ssh_config
sed -i 's/Port 22/Port 2222/g' /etc/ssh/sshd_config
sed -i 's/LoginGraceTime 120/LoginGraceTime 20/g' /etc/ssh/sshd_config
sed -i 's/PermitRootLogin yes/PermitRootLogin no/g' /etc/ssh/sshd_config
sed -i 's/\#MaxStartups 10:30:60/MaxStartups 2/g' /etc/ssh/sshd_config
echo -e "MaxAuthTries 2""\n""AllowUsers "$nombre"\n""X11UseLocalhost yes""\n""AddressFamily inet""\n""UseDNS no""\n""ClientAliveInterval 60">> /etc/ssh/sshd_config

#unity
apt -y install myunity unsettings compizconfig-settings-manager 



apt -y install oracle-java8-installer


xdg-mime default firefox.desktop x-scheme-handler/http
xdg-mime default firefox.desktop x-scheme-handler/https
echo "alias cp='gcp'" >> $casa/.bashrc
echo "alias cp='gcp'" >> /root/.bashrc
echo "alias update='apt update && apt -y full-upgrade && apt-get -y autoremove'" >> /root/.bashrc
echo "alias subir='git add . && git commit -a && git push --all'" >> $casa/.bashrc
sed -i 's/PRELINKING=unknown/PRELINKING=yes/g' /etc/default/prelink
sed -i 's/PRELINK_OPTS=-mR/PRELINK_OPTS=-amR/g' /etc/default/prelink
prelink -amvR
/etc/cron.daily/prelink
/usr/share/doc/libdvdread4/install-css.sh

clear
echo Finalizado se recomienda reiniciar, elaborado para ubuntu 64 bits por sinfallas.
exit 0
