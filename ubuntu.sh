#!/bin/bash
if [ $USER != root ]; then
echo "Error: run as root"
exit 1
fi
nombre=$(whoami)
casa=/home/$nombre
echo -e "net.ipv6.conf.all.disable_ipv6 = 1""\n""net.ipv6.conf.default.disable_ipv6 = 1""\n""net.ipv6.conf.lo.disable_ipv6 = 1" >> /etc/sysctl.d/60-disableipv6.conf
start procps
echo "* hard nproc 1000" >> /etc/security/limits.conf
echo "tmpfs /tmp tmpfs noexec,sync,nosuid,noatime,nodev 0 0" >> /etc/fstab
echo "tmpfs /var/cache/apt/archives tmpfs noatime,sync,nodev 0 0" >> /etc/fstab
echo "tmpfs /var/cache/samba tmpfs noatime,sync,nodev 0 0" >> /etc/fstab
echo "tmpfs /var/log tmpfs noatime,sync,nodev 0 0" >> /etc/fstab
echo "tmpfs /var/spool tmpfs noatime,sync,nodev 0 0" >> /etc/fstab
echo "tmpfs /var/tmp tmpfs noexec,sync,nosuid,noatime,nodev 0 0" >> /etc/fstab
echo 'INTEL_BATCH="1"' >> /etc/environment
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
apt update
apt -y --force-yes full-upgrade

apt -y install build-essential linux-firmware linux-firmware-nonfree intel-microcode hwdata ubuntu-restricted-extras non-free-codecs w64codecs pulseaudio-equalizer preload prelink synaptic ppa-purge y-ppa-manager xterm pv gcp localepurge bum sysv-rc-conf dkms grub-customizer 

apt -y install grsync dconf-tools ubuntu-tweak gimp gimp-plugin-registry nautilus-image-converter darktable scribus inkscape calibre vlc audacity acetoneiso isomaster pdfedit gnome-sushi nautilus-dropbox google-chrome-stable chromium-browser-l10n google-talkplugin community-themes libdvdread4 filezilla mumble unetbootin 

apt -y install myunity unsettings compizconfig-settings-manager 

sed -i 's/PRELINKING=unknown/PRELINKING=yes/g' /etc/default/prelink
sed -i 's/PRELINK_OPTS=-mR/PRELINK_OPTS=-amR/g' /etc/default/prelink
prelink -amvR
/etc/cron.daily/prelink
/usr/share/doc/libdvdread4/install-css.sh

clear
echo Finalizado se recomienda reiniciar, elaborado para ubuntu 64 bits por sinfallas.
exit 0
