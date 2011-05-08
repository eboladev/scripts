SKIP= \
	/etc/fstab \
	/etc/X11/Xresources \
	/etc/auto.nfs \
	/etc/auto.smb \
	/etc/auto.local \
	/etc/auto.master \
	/etc/X11/XF86Config \
	/etc/hosts.deny \
	/usr/bin/vpnc-connect \
	/etc/ssh/ssh_config \
	/etc/apt/sources.list \
	/etc/kissd.conf \
	/etc/fonts/local.conf \
	~polster/.inputrc \
	~polster/.vimrc \
	~polster/.profile \
	/etc/X11/Xmodmap \
	~polster/.xemacs/init.el \
	/etc/awstats/awstats.localhost.localdomain.conf \
	/etc/mysql/my.cnf \
	/var/www/mediawiki/LocalSettings.php \
	/etc/logrotate.d/pms \
	/etc/avahi/services/nfs.service \
	/etc/default/nfs-kernel-server \
	/etc/logrotate.d/airport \

TARGETS= \
	~polster/.forward \
	/root/.forward \
	/etc/exports \
	/etc/profile.d/bovi.sh \
	/etc/init.d/rc.local \
	/etc/PATH \
	/etc/MANPATH \
	/etc/hosts.allow \
	/etc/issue.net \
	/etc/apache2/conf.d/perl.conf \
	/etc/xinetd.d/svn \
	/etc/security/limits.conf \
	/etc/resolv.conf.nokia \
	/etc/denyhosts.conf \
	/etc/apache2/conf.d/subversion.conf \
	/etc/apache2/conf.d/mod_security.conf \
	/etc/apache2/conf/apache2.conf \
	/etc/apache2/conf.d/ssl.conf \
	/var/spool/cron/crontabs/root \
	/usr/local/bin/dyndnsupdate \
	/etc/ssh/sshd_config \
	/etc/samba/smb.conf \
	/etc/apache2/conf.d/python.conf \
	/etc/php.ini \
	/var/www/html/restore-umask.php \
	/etc/resolv.conf.tdc \
	/usr/local/bin/mountmaxtor \
	/var/spool/cron/crontabs/polster \
	/etc/bugzilla/localconfig \
	/usr/local/bin/fixmediaserver \
	/usr/local/bin/exportmusic \
	/etc/syslog.conf \
	/etc/samba/creds.tvixhd1 \
	/etc/sysctl.conf \
	/etc/mediatomb/config.xml \
	/etc/default/mediatomb \
	/etc/init.d/mediatomb \
	/etc/apache2/sites-available/default \
	/etc/apache2/sites-available/fauna \
	/etc/ssmtp/ssmtp.conf \
	/etc/ssmtp/revaliases \
	/etc/default/rkhunter \
	/etc/rkhunter.conf \
	/etc/logwatch/conf/logwatch.conf \
	/etc/mt-daapd.conf \
	/etc/default/syslogd \
	/etc/default/acpi-support \
	/etc/laptop-mode/laptop-mode.conf \
	/etc/default/nfs-common \
	/etc/modprobe.d/common.modprobe \
	/var/lib/ufw/user.rules \
	/usr/share/mediatomb/js/import.js \
	/etc/wvdial.conf \
	/usr/local/bin/telia.sh \
	/etc/apache2/sites-available/pipacs.dyndns.org \
	/etc/default/laptop-mode \
	/etc/init.d/ps3mediaserver \
	/opt/pms/PMS.conf \
	/etc/rc.local \
	/etc/X11/Xsession.d/95fixaudio \
	/etc/logrotate.d/mountmaxtor \
	/etc/X11/xorg.conf \
	~polster/.vnc/xstartup \
	/etc/dnsmasq.conf \
	/etc/dhcp3/dhclient.conf \
	/var/www/conf/hgweb.cfg \
	/mnt/maxtor/hg/hgwebdir.cgi \
	/etc/apache2/conf.d/mercurial.conf \
	/var/www/html/favicon.ico \
	/etc/pki/tls/private/pipacs.dyndns.org.key \
	/etc/pki/tls/certs/pipacs.dyndns.org.cert \

install: preinstall $(TARGETS)

preinstall:
	@if [ `id -u` != 0 ]; then echo "Run make as superuser"; exit 1; fi
	@if ! hostname -s | grep -q bovi; then \
	  echo "Run this on bovi"; \
	  exit 1; \
	fi

/etc/pki/tls/certs/pipacs.dyndns.org.cert: pipacs.dyndns.org.cert
	mkdir -p /etc/pki/tls/certs
	cp -f $< $@
	chown root:root $@

/etc/pki/tls/private/pipacs.dyndns.org.key: pipacs.dyndns.org.key
	mkdir -p /etc/pki/tls/private
	cp -f $< $@
	chown root:root $@

/var/www/html/favicon.ico: favicon.ico
	mkdir -p /var/www/html
	cp -f $< $@
	chmod a-w,a+r $@
	chown www-data:www-data /var/www/html/favicon.ico
	-/etc/init.d/apache2 restart

/etc/apache2/conf.d/mercurial.conf: mercurial.conf
	mkdir -p /etc/apache2/conf.d
	cp -f $< $@
	chmod a+r $@
	-a2enmod ssl
	-/etc/init.d/apache2 restart

/mnt/maxtor/hg/hgwebdir.cgi: hgwebdir.cgi
	mkdir -p /mnt/maxtor/hg
	cp -f $< $@
	chmod ug+rx,o-rwx $@
	chown www-data:www-data $@

/var/www/conf/hgweb.cfg: hgweb.cfg
	mkdir -p /var/www/conf
	cp -f $< $@
	chmod ug+r,o-rwx $@
	chown www-data:www-data $@

/etc/dhcp3/dhclient.conf: dhclient.conf
	mkdir -p /etc/dhcp3
	cp -f dhclient.conf /etc/dhcp3

/etc/dnsmasq.conf: dnsmasq.conf
	cp -f dnsmasq.conf /etc
	-/etc/init.d/dnsmasq restart

~polster/.vnc/xstartup: polster-vnc-xstartup
	mkdir -p ~polster/.vnc
	cp polster-vnc-xstartup ~polster/.vnc/xstartup
	chown -R polster:polster ~polster/.vnc
	chmod -R a+rx ~polster/.vnc

/opt/pms/debug.log:
	mkdir -p /opt/pms
	touch debug.log

/etc/X11/xorg.conf: xorg.conf
	cp -f xorg.conf $@
	chmod a+r $@

/etc/logrotate.d/mountmaxtor: logrotate-mountmaxtor
	cp -f logrotate-mountmaxtor $@

/etc/X11/Xsession.d/95fixaudio: 95fixaudio
	cp -f 95fixaudio $@
	chmod a+r $@

/etc/rc.local: /etc/init.d/rc.local
	rm -rf /etc/rc.local
	ln -s /etc/init.d/rc.local /etc/rc.local

/etc/logrotate.d/pms: logrotate-pms
	cp -f logrotate-pms $@

/opt/pms/PMS.conf: PMS.conf
	-mkdir -p /opt/pms
	cp -f PMS.conf $@
	chmod a+r $@
	-/etc/init.d/ps3mediaserver restart

/etc/init.d/ps3mediaserver: ps3mediaserver
	cp -f ps3mediaserver $@
	chmod ug+rx $@

/etc/default/laptop-mode: laptop-mode
	cp -f laptop-mode $@
	-/etc/init.d/laptop-mode restart

/etc/apache2/sites-available/pipacs.dyndns.org: sites-available-pipacs.dyndns.org
	mkdir -p /etc/apache2/sites-available
	cp -f sites-available-pipacs.dyndns.org $@
	-a2dissite pipacs.dyndns.org; a2ensite pipacs.dyndns.org
	-a2enmod ssl
	-/etc/init.d/apache2 restart

/etc/apache2/sites-available/default: sites-available-default
/usr/local/bin/telia.sh: telia.sh
	cp -f telia.sh $@
	chmod a+rx $@

/etc/wvdial.conf: wvdial.conf
	cp -f wvdial.conf /etc
	chmod a+r /etc/wvdial.conf

/usr/share/mediatomb/js/import.js: import.js
	mkdir -p /usr/share/mediatomb/js
	cp -f import.js $@
	chmod a+r $@
	-/etc/init.d/mediatomb stop
	-rm -f /var/lib/mediatomb/sqlite3.db*
	-/etc/init.d/mediatomb start

/var/lib/ufw/user.rules: user.rules
	mkdir -p /var/lib/ufw
	cp -f user.rules $@
	-restart ufw

/etc/modprobe.d/common.modprobe: common.modprobe
	cp common.modprobe $@
	-/etc/init.d/nfs-kernel-server stop
	-modprobe -r nfs
	-modprobe -r lockd
	-/etc/init.d/nfs-kernel-server start

/etc/default/nfs-common: nfs-common
	cp -f nfs-common $@
	-/etc/init.d/nfs-kernel-server restart

/etc/laptop-mode/laptop-mode.conf: laptop-mode.conf
	mkdir -p /etc/laptop-mode
	cp -f laptop-mode.conf /etc/laptop-mode
	-/etc/init.d/laptop-mode stop
	-/etc/init.d/laptop-mode start

/etc/default/acpi-support: acpi-support
	mkdir -p /etc/default
	cp -f acpi-support /etc/default
	-/etc/init.d/laptop-mode stop
	-/etc/init.d/laptop-mode start

/etc/default/syslogd: syslogd
	mkdir -p /etc/default
	cp -f syslogd /etc/default
	-restart rsyslog

/etc/avahi/services/nfs.service: nfs.service
	mkdir -p /etc/avahi/services
	cp -f nfs.service /etc/avahi/services
	-/etc/init.d/avahi-daemon restart

/etc/default/nfs-kernel-server: nfs-kernel-server
	cp -f nfs-kernel-server /etc/default/nfs-kernel-server
	-/etc/init.d/nfs-kernel-server restart

/etc/mt-daapd.conf: mt-daapd.conf
	cp -f mt-daapd.conf /etc
	chmod o-rwx /etc/mt-daapd.conf
	-/etc/init.d/mt-daapd restart

/etc/logwatch/conf/logwatch.conf: logwatch.conf
	mkdir -p /etc/logwatch/conf
	cp -f logwatch.conf /etc/logwatch/conf

/etc/rkhunter.conf: rkhunter.conf
	cp -f rkhunter.conf $@
	chmod og-rw $@

/etc/default/rkhunter: rkhunter
	mkdir -p /etc/default
	cp -f rkhunter /etc/default

/etc/ssmtp/revaliases: revaliases
	mkdir -p /etc/ssmtp
	cp -f revaliases /etc/ssmtp

/etc/ssmtp/ssmtp.conf: ssmtp.conf
	mkdir -p /etc/ssmtp
	cp -f ssmtp.conf /etc/ssmtp
	chmod og-rwx /etc/ssmtp/ssmtp.conf

/etc/apache2/sites-available/fauna: sites-available-fauna
	mkdir -p /etc/apache2/sites-available
	cp -f sites-available-fauna $@
	-a2dissite fauna; a2ensite fauna
	-a2enmod ssl
	mkdir -p /var/www/html-fauna
	-/etc/init.d/apache2 restart

/etc/apache2/sites-available/default: sites-available-default
	mkdir -p /etc/apache2/sites-available
	cp -f sites-available-default /etc/apache2/sites-available/default
	-a2enmod ssl
	-/etc/init.d/apache2 restart

/etc/init.d/mediatomb: init-mediatomb
	cp -f init-mediatomb /etc/init.d/mediatomb
	chmod a+rx /etc/init.d/mediatomb

/etc/default/mediatomb: mediatomb
	mkdir -p /etc/default
	cp -f mediatomb /etc/default
	-/etc/init.d/mediatomb restart

/etc/mediatomb/config.xml: mediatomb-config.xml
	mkdir -p /etc/mediatomb
	-/etc/init.d/mediatomb stop
	cp mediatomb-config.xml $@
	chmod a+r,og-w $@
	-rm -f /var/lib/mediatomb/sqlite3.db*
	-/etc/init.d/mediatomb start

/etc/sysctl.conf: sysctl.conf
	cp -f sysctl.conf /etc

/etc/samba/creds.tvixhd1: creds.tvixhd1
	mkdir -p /etc/samba
	cp -f creds.tvixhd1 /etc/samba
	chmod og-rwx /etc/samba/creds.tvixhd1

/etc/logrotate.d/airport: logrotate-airport
	cp -f logrotate-airport /etc/logrotate.d/airport

/etc/syslog.conf: syslog.conf
	cp -f syslog.conf /etc
	chmod a+r,og-w /etc/syslog.conf
	-restart rsyslog

~polster/.forward: forward.polster
	cp -f forward.polster ~polster/.forward
	chown polster:polster ~polster/.forward

/root/.forward: forward.root
	cp -f forward.root /root/.forward
	chmod og-rwx /root/.forward

/usr/local/bin/fixmediaserver: fixmediaserver
	cp -f fixmediaserver /usr/local/bin
	chmod a+rx /usr/local/bin/fixmediaserver

/etc/bugzilla/localconfig: localconfig
	mkdir -p /etc/bugzilla
	cp -f localconfig /etc/bugzilla
	chown www-data:www-data /etc/bugzilla/localconfig
	chmod o-rwx /etc/bugzilla/localconfig
	-a2enmod ssl
	-/etc/init.d/apache2 restart

/etc/mysql/my.cnf: my.cnf
	mkdir -p /etc/mysql
	cp -f my.cnf /etc/mysql
	-/etc/init.d/mysqld restart

/usr/local/bin/mountmaxtor: mountmaxtor
	cp mountmaxtor /usr/local/bin
	chmod a+rx /usr/local/bin/mountmaxtor

/etc/resolv.conf.tdc: resolv.conf.tdc
	cp -f resolv.conf.tdc /etc

/var/www/mediawiki/LocalSettings.php: LocalSettings.php
	sed s/secnok/`cat /etc/secnok`/g $< | \
	sed s/sechom/`cat /etc/sechom`/g > $@
	chown www-data:www-data $@
	chmod a-w,og-r $@

~polster/Documents/vmware/w2kpro.vmx: w2kpro.vmx
	su polster -c "mkdir -p ~/Documents/vmware; cp -f w2kpro.vmx ~/Documents/vmware"

/etc/php.ini: php.ini
	cp -f php.ini /etc
	-a2enmod ssl
	-/etc/init.d/apache2 restart

/var/www/html/restore-umask.php: restore-umask.php
	mkdir -p /var/www/html
	cp -f restore-umask.php /var/www/html
	chown www-data:www-data /var/www/html/restore-umask.php

/etc/awstats/awstats.localhost.localdomain.conf: awstats.localhost.localdomain.conf
	mkdir -p /etc/awstats
	cp -f awstats.localhost.localdomain.conf /etc/awstats

/etc/bluetooth/hcid.conf: hcid.conf
	mkdir -p /etc/bluetooth
	cp -f hcid.conf /etc/bluetooth
	-/etc/init.d/bluetooth restart

/etc/apache2/conf.d/python.conf: python.conf
	mkdir -p /etc/apache2/conf.d
	cp -f python.conf /etc/apache2/conf.d
	-a2enmod ssl
	-/etc/init.d/apache2 restart

/etc/ssh/ssh_config: ssh_config
	mkdir -p /etc/ssh
	cp -f ssh_config /etc/ssh
	chmod a+r,og-w /etc/ssh/ssh_config

/etc/ssh/sshd_config: sshd_config
	mkdir -p /etc/ssh
	cp -f sshd_config /etc/ssh
	chmod og-rwx /etc/ssh/sshd_config
	-/etc/init.d/ssh restart

/usr/local/bin/dyndnsupdate: dyndnsupdate
	cp -f dyndnsupdate /usr/local/bin
	chmod u+rx,og-rwx /usr/local/bin/dyndnsupdate

/var/spool/cron/crontabs/root: crontab.root
	crontab crontab.root

/etc/apache2/conf.d/ssl.conf: ssl.conf
	mkdir -p /etc/apache2/conf.d
	cp -f ssl.conf /etc/apache2/conf.d
	-a2enmod ssl
	-/etc/init.d/apache2 restart

/etc/apache2/conf.d/subversion.conf: subversion.conf
	mkdir -p /etc/apache2/conf.d
	cp -f subversion.conf /etc/apache2/conf.d
	-a2enmod ssl
	-/etc/init.d/apache2 restart

/etc/apache2/conf.d/mod_security.conf: mod_security.conf
	mkdir -p /etc/apache2/conf.d
	cp -f mod_security.conf /etc/apache2/conf.d
	-a2enmod ssl
	-/etc/init.d/apache2 restart

/usr/local/bin/nokiadown: nokiadown
	cp -f nokiadown /usr/local/bin
	chmod a+rx /usr/local/bin/nokiadown

/usr/local/bin/nokiaup: nokiaup
	cp -f nokiaup /usr/local/bin
	chmod a+rx /usr/local/bin/nokiaup

/etc/modprobe.conf: modprobe.conf
	cp -f modprobe.conf /etc
	chmod og-rw /etc/modprobe.conf

/etc/denyhosts.conf: denyhosts.cfg
	cp -f denyhosts.cfg /etc/denyhosts.conf
	chmod og-rw /etc/denyhosts.conf
	-/etc/init.d/denyhosts restart

/etc/vpnc/nokia.conf: nokia.conf
	mkdir -p /etc/vpnc
	cp -f nokia.conf /etc/vpnc
	chmod og-rwx /etc/vpnc/nokia.conf

~polster/.bash_profile: bash_profile.polster
	su polster -c "cp -f bash_profile.polster ~/.bash_profile; chmod u+x,og-rwx ~/.bash_profile"

/usr/local/bin/nokia-vpn: nokia-vpn
	cp -f nokia-vpn /usr/local/bin
	chmod a+rx /usr/local/bin/nokia-vpn

/usr/bin/vpnc-connect: vpnc-connect
	cp -f vpnc-connect /usr/bin
	chmod a+rx /usr/bin/vpnc-connect

/etc/resolv.conf.nokia: resolv.conf.nokia
	cp -f resolv.conf.nokia /etc

/usr/local/bin/qtopiafb: qtopiafb
	mkdir -p /usr/local/bin
	cp -f qtopiafb /usr/local/bin
	chmod a+rx /usr/local/bin/qtopiafb

/etc/samba/filemon-creds: filemon-creds
	mkdir -p /etc/samba
	cp -f filemon-creds /etc/samba
	chmod og-rwx /etc/samba/filemon-creds

/etc/security/limits.conf: limits.conf
	mkdir -p /etc/security
	cp -f limits.conf /etc/security

/usr/share/applications/local/azureus.desktop: azureus.desktop
	mkdir -p /usr/share/applications/local
	cp -f azureus.desktop /usr/share/applications/local

/etc/kissd.conf: kissd.conf
	cp -f kissd.conf /etc

/etc/xinetd.d/svn: svn
	mkdir -p /etc/xinetd.d
	cp -f svn /etc/xinetd.d/svn
	-/etc/init.d/xinetd restart

/etc/apache2/conf.d/perl.conf: perl.conf
	mkdir -p /etc/apache2/conf.d
	cp -f perl.conf /etc/apache2/conf.d
	-a2enmod ssl
	-/etc/init.d/apache2 restart

/etc/apache2/conf/apache2.conf: apache2.conf
	mkdir -p /etc/apache2/conf
	cp -f apache2.conf /etc/apache2/conf
	-a2enmod ssl
	-a2enmod rewrite
	-a2enmod dav
	-a2enmod dav_fs
	-/etc/init.d/apache2 restart

/etc/shorewall/rules: rules
	mkdir -p /etc/shorewall
	cp -f rules /etc/shorewall
	chmod og-rw /etc/shorewall/rules

/etc/issue.net: issue.net
	cp -f issue.net /etc

/etc/hosts.deny: hosts.deny
	cp -f hosts.deny /etc

/etc/hosts.allow: hosts.allow
	cp -f hosts.allow /etc
	chmod a+r,og-w /etc/hosts.allow

/etc/exports: exports
	cp -f exports /etc
	-exportfs -ra
	-/etc/init.d/portmapd restart
	-/etc/init.d/nfs-kernel-server restart

/etc/ppp/peers/p800-bt.chat: p800-bt.chat
	mkdir -p /etc/ppp/peers
	cp -f p800-bt.chat /etc/ppp/peers
	chmod a+r /etc/ppp/peers/p800-bt.chat

/etc/auto.nfs: auto.nfs
	cp -f auto.nfs /etc/auto.nfs
	-/etc/init.d/autofs restart

/var/spool/cron/crontabs/polster: crontab.polster
	su polster -c "crontab crontab.polster"

/etc/apt/sources.list: sources.list
	mkdir -p /etc/apt
	cp -f sources.list /etc/apt

/etc/PATH: PATH
	cp -f PATH /etc
	chmod a+r /etc/PATH

/etc/MANPATH: MANPATH
	cp -f MANPATH /etc
	chmod a+r /etc/MANPATH

~polster/.xemacs/init.el: init.el.polster
	su polster -c \
	  "mkdir -p ~/.xemacs; cp -f init.el.polster ~/.xemacs/init.el"

/etc/init.d/rc.local: rc.local
	cp -f rc.local /etc/init.d
	chmod a+x /etc/init.d/rc.local

~polster/.profile: profile.polster
	su polster -c "cp -f profile.polster ~/.profile"
	su polster -c "cp -f profile.polster ~/.bashrc"

/etc/X11/Xmodmap: Xmodmap
	mkdir -p /etc/X11
	cp -f Xmodmap /etc/X11

/etc/profile.d/bovi.sh: bovi.sh
	mkdir -p /etc/profile.d
	cp -f bovi.sh /etc/profile.d
	chmod a+rx /etc/profile.d/bovi.sh

/etc/X11/Xresources: Xresources
	mkdir -p /etc/X11
	cp -f Xresources /etc/X11

/etc/auto.local: auto.local
	cp -f auto.local /etc
	-/etc/init.d/autofs restart

~polster/.vimrc: vimrc.polster
	su polster -c "cp -f vimrc.polster ~/.vimrc"

~polster/.inputrc: inputrc.polster
	su polster -c "cp -f inputrc.polster ~/.inputrc"

/etc/X11/XF86Config: XF86Config
	cp -f XF86Config /etc/X11/XF86Config

/etc/modules.conf: modules.conf
	cp -f modules.conf /etc
	chmod og-rw /etc/modules.conf

/etc/auto.master: auto.master
	cp -f auto.master /etc
	-/etc/init.d/autofs restart

/etc/auto.smb: auto.smb
	cp -f auto.smb /etc
	-/etc/init.d/autofs restart

/etc/fonts/local.conf: local.conf
	mkdir -p /etc/fonts
	cp -f local.conf /etc/fonts

/etc/fstab: fstab
	cp -f fstab /etc

/etc/hosts: hosts
	cp -f hosts /etc

/etc/samba/smb.conf: smb.conf
	mkdir -p /etc/samba
	cp -f smb.conf /etc/samba
	-service smbd restart
