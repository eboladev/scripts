NON_TARGETS=\
	/etc/X11/xorg.conf \
	/etc/httpd/conf/httpd.conf \
	/etc/sysconfig/network-scripts/ifcfg-wlan0 \
	/etc/sysconfig/network-scripts/ifcfg-dummy0 \
	/etc/sysconfig/slmodemd \
	/home/polster/.kde/Autostart/tpbuttons \
	/etc/tpbrc \
	/etc/X11/XF86Config.ati \
	/etc/acpi/events/lid.conf \
	/etc/acpi/events/sleepbutton.conf \
	/etc/PolicyKit/PolicyKit.conf \
	/etc/X11/XF86Config.free \
	/usr/share/applications/magicdraw.desktop \
	/etc/X11/Xmodmap \
	~root/.forward \
	/etc/apt/sources.list.d/ssherminator.list \

TARGETS=\
	/etc/X11/Xresources/local \
	/etc/samba/smb.conf \
	/etc/hosts.allow \
	/etc/hosts.allow.nok \
	/etc/PATH \
	/etc/MANPATH \
	/etc/rc.local \
	/etc/samba/creds.polster \
	/etc/samba/creds-home.polster \
	/home/polster/etc/creds.polster \
	/home/polster/etc/creds-home.polster \
	/etc/samba/creds.tvixhd1 \
	/home/polster/.xemacs/init.el \
	/var/spool/cron/crontabs/polster \
	/etc/profile.d/nolove.sh \
	/usr/local/bin/fixmake \
	/usr/local/bin/savedotnul \
	/usr/local/bin/t32 \
	/etc/bluetooth/pin \
	/etc/bluetooth/hcid.conf \
	/home/polster/bin/xsetup \
	/usr/local/bin/mybackup \
	/usr/local/bin/runsametime \
	/etc/bluetooth/rfcomm.conf \
	/etc/sysctl.conf \
	/etc/ssh/sshd_config \
	/etc/network/iptables.nolove \
	/etc/resolv.conf.home \
	/etc/acpi/ibm/thinkpad-brightness-up.sh \
	/etc/acpi/ibm/thinkpad-brightness-down.sh \
	/etc/cron.daily/mailmyip \
	/etc/init.d/pre-x \
	/usr/share/applications/lightzone.desktop \
	/etc/ssmtp/ssmtp.conf \
	/etc/ssmtp/revaliases \
	/etc/logwatch/conf/logwatch.conf \
	/usr/share/applications/truecrypt-secrets.desktop \
	/usr/share/applications/eclipse.desktop \
	/usr/share/pixmaps/eclipse.png \
	/etc/init.d/umountfusenet \
	/var/spool/cron/crontabs/root \
	/etc/gdm/gdm.conf \
	/etc/network/if-up.d/nolove-ifup \
	/etc/network/if-down.d/nolove-ifdown \
	/etc/logrotate.d/nolove-ifup \
	/etc/logrotate.d/nolove-ifdown \
	/home/polster/.bash_profile \
	/etc/rkhunter.conf \
	/home/polster/bin/listen-bt \
	/etc/profile.d/lps.sh \
	/usr/local/bin/start-tomcat \
	/usr/local/bin/stop-tomcat \
	/etc/vpnc/vpnc-script-post-connect-action \
	/usr/lib/firefox-addons/searchplugins/nokia-phonebook.xml \
	/etc/dnsmasq.conf \
	/etc/dhcp3/dhclient.conf \
	/etc/udev/rules.d/40-libsane-extras.rules \
	/etc/denyhosts.conf \
	/home/polster/.vnc/xstartup \
	/usr/local/bin/pptview \
	/home/polster/.hgrc \
	/home/polster/.bazaar/bazaar.conf

install: preinstall $(TARGETS)

preinstall:
	@if id | grep -iqv root; then \
	  echo "Run this as an root"; \
	  exit 1; \
	fi
	@case `hostname -s` in \
		nolove*)	;; \
		*)		echo "Run this on nolove"; exit 1;; \
	esac

/home/polster/.bazaar/bazaar.conf: bazaar.conf
	mkdir -p /home/polster/.bazaar
	cp -f $< $@
	chown -R polster:polster /home/polster/.bazaar

/home/polster/.hgrc: dot-hgrc /etc/secnok /etc/sechom
	rm -f $@
	sed s/secnok/`cat /etc/secnok`/ $< | \
	sed s/sechom/`cat /etc/sechom`/ > $@
	chown -R polster:polster $@
	chmod u+r,og-rw $@

/usr/local/bin/pptview: pptview
	cp -f $< $@
	chmod a+rx $@

/home/polster/.vnc/xstartup: polster-vnc-xstartup
	mkdir -p /home/polster/.vnc
	cp -f $< $@
	chown -R polster:polster /home/polster/.vnc

/etc/denyhosts.conf: denyhosts.cfg
	cp -f $< $@
	-/etc/init.d/denyhosts restart

/etc/udev/rules.d/40-libsane-extras.rules: 40-libsane-extras.rules
	mkdir -p /etc/udev/rules.d
	cp -f $< $@
	chmod a+r $@

/etc/dhcp3/dhclient.conf: dhclient.conf
	mkdir -p /etc/dhcp3
	cp -f dhclient.conf /etc/dhcp3

/etc/dnsmasq.conf: dnsmasq.conf
	cp -f dnsmasq.conf /etc
	-/etc/init.d/dnsmasq restart

/usr/lib/firefox-addons/searchplugins/nokia-phonebook.xml: nokia-phonebook.xml
	mkdir -p /usr/lib/firefox-addons/searchplugins
	cp -f nokia-phonebook.xml $@
	chmod a+r $@

/etc/vpnc/vpnc-script-post-connect-action: vpnc-script-post-connect-action
	mkdir -p /etc/vpnc
	cp -f vpnc-script-post-connect-action $@

/usr/local/bin/stop-tomcat: stop-tomcat
	cp -f stop-tomcat $@
	chmod a+rx $@

/usr/local/bin/start-tomcat: start-tomcat
	cp -f start-tomcat $@
	chmod a+rx $@

/etc/profile.d/lps.sh: lps.sh
	cp -f lps.sh $@
	chmod a+rx $@

/home/polster/bin/listen-bt: listen-bt
	cp -f listen-bt $@
	chmod a+rx $@
	chown polster:polster $@

/etc/rkhunter.conf: rkhunter.conf
	cp -f rkhunter.conf $@
	chmod og-rwx $@

/home/polster/.bash_profile: polster.bash_profile
	cp -f polster.bash_profile $@
	chmod u+rwx $@
	chown polster:polster $@

/etc/logrotate.d/nolove-ifup: logrotate-nolove-ifup
	mkdir -p /etc/logrotate.d
	cp -f logrotate-nolove-ifup $@
	chmod a+r $@

/etc/logrotate.d/nolove-ifdown: logrotate-nolove-ifdown
	mkdir -p /etc/logrotate.d
	cp -f logrotate-nolove-ifdown $@
	chmod a+r $@

/etc/network/if-up.d/nolove-ifup: nolove-ifup
	mkdir -p /etc/network/if-up.d
	cp -f nolove-ifup $@
	chmod a+rx $@

/etc/network/if-down.d/nolove-ifdown: nolove-ifdown
	mkdir -p /etc/network/if-down.d
	cp -f nolove-ifdown $@
	chmod a+rx $@

/etc/gdm/gdm.conf: gdm.conf
	mkdir -p /etc/gdm
	cp -f gdm.conf $@

/etc/apt/sources.list.d/ssherminator.list: ssherminator.list
	mkdir -p /etc/apt/sources.list.d
	cp -f ssherminator.list $@
	chmod a+r $@
	wget -O - 'http://keyserver.ubuntu.com:11371/pks/lookup?op=get&search=0x7EF7EED3AE0363FE' | apt-key add -
	apt-get update

/etc/init.d/umountfusenet: umountfusenet
	cp -f umountfusenet $@
	chmod a+rx $@
	for i in 0 1 2 3 4 5 6; do \
	  rm -f /etc/rc$$i.d/K12umountfusenet; \
	  ln -s /etc/init.d/umountfusenet /etc/rc$$i.d/K12umountfusenet; \
	done

/usr/share/pixmaps/eclipse.png: eclipse.png
	cp -f eclipse.png $@
	chmod a+r $@

/usr/share/applications/eclipse.desktop: eclipse.desktop
	cp -f eclipse.desktop /usr/share/applications
	chmod a+r $@

/usr/share/applications/truecrypt-secrets.desktop: truecrypt-secrets.desktop
	cp -f truecrypt-secrets.desktop /usr/share/applications
	chmod a+r $@

/etc/logwatch/conf/logwatch.conf: logwatch.conf
	mkdir -p /etc/logwatch/conf
	cp -f logwatch.conf /etc/logwatch/conf

/etc/ssmtp/ssmtp.conf: ssmtp.conf
	mkdir -p /etc/ssmtp
	cp -f ssmtp.conf /etc/ssmtp
	chmod a+r /etc/ssmtp/ssmtp.conf

/etc/ssmtp/revaliases: revaliases
	mkdir -p /etc/ssmtp
	cp -f revaliases /etc/ssmtp
	chmod a+r /etc/ssmtp/revaliases

/usr/share/applications/lightzone.desktop: lightzone.desktop
	cp -f lightzone.desktop /usr/share/applications
	chmod a+r $@

/usr/share/applications/magicdraw.desktop: magicdraw.desktop
	cp -f magicdraw.desktop /usr/share/applications
	chmod a+r $@

/etc/init.d/pre-x: pre-x
	cp -f pre-x /etc/init.d
	chmod a+rx /etc/init.d/pre-x
	for i in 2 3 4 5; do \
	    rm -f /etc/rc$$i.d/S12pre-x; \
	    ln -s /etc/init.d/pre-x /etc/rc$$i.d/S12pre-x; \
	done

/etc/cron.daily/mailmyip: mailmyip
	cp -f mailmyip /etc/cron.daily
	chmod a+rx /etc/cron.daily/mailmyip

~root/.forward: forward.root
	cp -f forward.root ~root/.forward

/etc/acpi/ibm/thinkpad-brightness-up.sh: thinkpad-brightness-up.sh
	mkdir -p /etc/acpi/ibm
	cp -f thinkpad-brightness-up.sh /etc/acpi/ibm
	chmod a+rx /etc/acpi/ibm/thinkpad-brightness-up.sh

/etc/acpi/ibm/thinkpad-brightness-down.sh: thinkpad-brightness-down.sh
	mkdir -p /etc/acpi/ibm
	cp -f thinkpad-brightness-down.sh /etc/acpi/ibm
	chmod a+rx /etc/acpi/ibm/thinkpad-brightness-down.sh

/etc/resolv.conf.home: resolv.conf.home
	cp -f resolv.conf.home /etc

/etc/PolicyKit/PolicyKit.conf: PolicyKit.conf
	mkdir -p /etc/PolicyKit
	cp -f PolicyKit.conf /etc/PolicyKit
	chmod a+r /etc/PolicyKit/PolicyKit.conf

/etc/ssh/sshd_config: sshd_config
	mkdir -p /etc/ssh
	cp -f $< $@
	chmod o-rwx $@
	-/etc/init.d/ssh restart

/etc/sysctl.conf: sysctl.conf
	cp -f sysctl.conf /etc

/usr/local/bin/runslickedit: runslickedit
	cp -f runslickedit /usr/local/bin
	chmod a+rx /usr/local/bin/runslickedit

/usr/local/bin/runnose: runnose
	cp -f runnose /usr/local/bin
	chmod a+rx /usr/local/bin/runnose

/usr/local/bin/runphone: runphone
	cp -f runphone /usr/local/bin
	chmod a+rx /usr/local/bin/runphone

/etc/bluetooth/rfcomm.conf: rfcomm.conf
	mkdir -p /etc/bluetooth
	cp -f rfcomm.conf /etc/bluetooth
	-/etc/init.d/bluetooth restart

/usr/local/bin/runsametime: runsametime
	mkdir -p /usr/local/bin
	cp -f runsametime /usr/local/bin
	chmod a+rx /usr/local/bin/runsametime

/usr/local/bin/mybackup: mybackup
	mkdir -p /usr/local/bin
	cp -f mybackup /usr/local/bin
	chmod a+rx /usr/local/bin/mybackup

/etc/X11/Xmodmap: Xmodmap
	-mkdir -p /etc/X11
	cp -f Xmodmap /etc/X11

/home/polster/bin/xsetup: xsetup
	-mkdir -p /home/polster/bin
	cp -f xsetup /home/polster/bin
	chmod a+rx /home/polster/bin/xsetup
	chown -R polster:polster /home/polster/bin
	
/etc/bluetooth/hcid.conf: hcid.conf
	mkdir -p /etc/bluetooth
	cp -f hcid.conf /etc/bluetooth
	-service bluetooth restart

/etc/bluetooth/pin: pin
	mkdir -p /etc/bluetooth
	cp -f pin /etc/bluetooth
	chmod og-rx /etc/bluetooth/pin
	-service bluetooth restart

/usr/local/bin/t32: t32
	cp -f t32 /usr/local/bin
	chmod a+rx /usr/local/bin/t32

/etc/httpd/conf/httpd.conf: httpd.conf
	mkdir -p /etc/httpd/conf
	cp -f httpd.conf /etc/httpd/conf
	-service httpd restart

/etc/acpi/events/sleepbutton.conf: sleepbutton.conf
	mkdir -p /etc/acpi/events
	cp -f sleepbutton.conf /etc/acpi/events
	-service acpid restart

/etc/acpi/events/lid.conf: lid.conf
	mkdir -p /etc/acpi/events
	cp -f lid.conf /etc/acpi/events
	-service acpid restart

/etc/MANPATH: MANPATH
	cp -f MANPATH /etc
	chmod a+r /etc/MANPATH
/etc/hosts: hosts
	cp -f hosts /etc/hosts

/etc/X11/xorg.conf: xorg.conf
	mkdir -p /etc/X11
	cp -f xorg.conf /etc/X11

/etc/sysconfig/slmodemd: slmodemd
	mkdir -p /etc/sysconfig
	cp -f slmodemd /etc/sysconfig

/usr/local/bin/savedotnul: savedotnul
	cp -f savedotnul /usr/local/bin
	chmod a+rx /usr/local/bin/savedotnul

/usr/local/bin/fixmake: fixmake
	cp -f fixmake /usr/local/bin
	chmod a+rx /usr/local/bin/fixmake

/etc/X11/XF86Config.ati: XF86Config.ati
	mkdir -p /etc/X11
	cp -f XF86Config.ati /etc/X11

/var/spool/cron/crontabs/polster: crontab.polster
	su polster -c "crontab crontab.polster"

/var/spool/cron/crontabs/root: crontab.root
	crontab crontab.root

/etc/network/iptables.nolove: iptables.nolove
	mkdir -p /etc/network
	cp -f iptables.nolove /etc/network
	iptables-restore < /etc/network/iptables.nolove

/etc/tpbrc: tpbrc
	cp -f tpbrc /etc

/home/polster/.kde/Autostart/tpbuttons: tpbuttons
	mkdir -p /home/polster/.kde/Autostart
	cp -f tpbuttons /home/polster/.kde/Autostart
	chown -R polster:polster /home/polster/.kde
	chmod +rx /home/polster/.kde/Autostart/tpbuttons

/etc/rc.local: rc.local
	cp -f rc.local /etc/rc.local

/home/polster/etc/creds-home.polster: creds-home.polster /etc/sechom
	mkdir -p /home/polster/etc
	rm -f $@
	sed s/sechom/`cat /etc/sechom`/g $< > $@
	chown polster:polster $@
	chmod og-rw $@

/home/polster/etc/creds.polster: creds.polster /etc/secnok /etc/sechom
	mkdir -p /home/polster/etc
	rm -f $@
	sed s/secnok/`cat /etc/secnok`/g $< | sed s/sechom/`cat /etc/sechom`/g > $@
	chown polster:polster $@
	chmod og-rw $@

/etc/samba/creds.polster: /home/polster/etc/creds.polster
	mkdir -p /etc/samba
	ln -sf /home/polster/etc/creds.polster /etc/samba/creds.polster

/etc/samba/creds-home.polster: /home/polster/etc/creds-home.polster
	mkdir -p /etc/samba
	ln -sf /home/polster/etc/creds-home.polster /etc/samba/creds-home.polster

/etc/samba/creds.tvixhd1: creds.tvixhd1
	mkdir -p /etc/samba
	cp -f creds.tvixhd1 /etc/samba
	chmod og-rw /etc/samba/creds.tvixhd1

/etc/hosts.allow.nok: hosts.allow.nok
	cp -f hosts.allow.nok /etc

/etc/hosts.allow: hosts.allow
	cp -f hosts.allow /etc

/etc/samba/smb.conf: smb.conf
	mkdir -p /etc/samba
	cp -f smb.conf /etc/samba

/etc/sysconfig/network-scripts/ifcfg-dummy0: ifcfg-dummy0
	cp -f ifcfg-dummy0 /etc/sysconfig/network-scripts/ifcfg-dummy0
	chmod og-rw /etc/sysconfig/network-scripts/ifcfg-dummy0

/etc/sysconfig/network-scripts/ifcfg-wlan0: ifcfg-wlan0
	cp -f ifcfg-wlan0 /etc/sysconfig/network-scripts/ifcfg-wlan0
	chmod og-rw /etc/sysconfig/network-scripts/ifcfg-wlan0

/etc/sysconfig/iptables.internet: iptables.internet
	cp -f iptables.internet /etc/sysconfig

/home/polster/.xemacs/init.el: init.el
	mkdir -p /home/polster/.xemacs
	cp -f init.el /home/polster/.xemacs
	chown -R polster:polster /home/polster/.xemacs

/etc/X11/Xresources/local: Xresources
	mkdir -p /etc/X11/Xresources
	cp -f Xresources /etc/X11/Xresources/local

/etc/profile.d/nolove.sh: nolove.sh
	mkdir -p /etc/profile.d
	cp -f nolove.sh /etc/profile.d
	chmod a+rx /etc/profile.d/nolove.sh

/etc/PATH: PATH
	cp -f PATH /etc
