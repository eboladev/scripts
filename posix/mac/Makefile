TARGETS= \
	/Users/polster/.nsmbrc \
	/etc/X11/xinit/xinitrc \
	/usr/local/bin/restartvpn \
	/etc/profile.d/macports.sh \
	/Users/polster/bin/enter-proximity-silva.scpt \
	/usr/local/bin/mkdmg \
	/etc/nsmb.conf \
	/Users/polster/Library/Preferences/nsmb.conf \
	/usr/local/bin/runterm \
	/Users/polster/.hgrc \
	/Users/polster/.netrc \
	/usr/local/bin/locchghook \
	/Library/LaunchAgents/com.macosxints.locchghook.plist \
	/etc/smb.conf \
	/usr/local/bin/vpn-connect.sh \
	/Applications/Internet/vpn-connect.app \
	/Applications/Programming/Start-CM-Synergy.app \
	/Applications/Programming/BuildTerm.app

DIRS = maczok marzipan

install: preinstall $(TARGETS)
	-for d in $(DIRS); do (cd $$d; make install); done

preinstall:
	@if [ `id -u` != 0 ]; then echo "Run make as superuser"; exit 1; fi
	@case `uname` in \
		Darwin)	;; \
		*)	echo "Run this on a Mac"; exit 1;; \
	esac

/Applications/Programming/BuildTerm.app: BuildTerm.applescript BuildTerm.icns
	-rm -rf /Applications/Programming/BuildTerm.app
	mkdir -p /Applications/Programming
	osacompile -o /Applications/Programming/BuildTerm.app \
	  BuildTerm.applescript
	cp -f BuildTerm.icns \
	  /Applications/Programming/BuildTerm.app/Contents/Resources/applet.icns
	touch /Applications/Programming/BuildTerm.app/Contents/Info.plist

/Applications/Programming/Start-CM-Synergy.app: Start-CM-Synergy.applescript Start-CM-Synergy.icns
	-rm -rf /Applications/Programming/Start-CM-Synergy.app
	mkdir -p /Applications/Programming
	osacompile -o /Applications/Programming/Start-CM-Synergy.app \
	  Start-CM-Synergy.applescript
	cp -f Start-CM-Synergy.icns /Applications/Programming/Start-CM-Synergy.app/Contents/Resources/applet.icns
	touch /Applications/Programming/Start-CM-Synergy.app/Contents/Info.plist

/Applications/Internet/vpn-connect.app: vpn-connect.applescript vpn-connect.icns
	-rm -rf /Applications/Internet/vpn-connect.app
	mkdir -p /Applications/Internet
	osacompile -o /Applications/Internet/vpn-connect.app \
	  vpn-connect.applescript
	cp -f vpn-connect.icns /Applications/Internet/vpn-connect.app/Contents/Resources/applet.icns
	touch /Applications/Internet/vpn-connect.app/Contents/Info.plist

/usr/local/bin/vpn-connect.sh: vpn-connect.sh
	cp -f $< $@
	chmod a+rx $@

/etc/smb.conf: smb.conf
	cp -f $< $@
	chmod a+r $@

/Library/LaunchAgents/com.macosxints.locchghook.plist: com.macosxints.locchghook.plist
	cp -f $< $@
	chmod a+r $@
	-launchctl unload $@
	launchctl load $@

/usr/local/bin/locchghook: locchghook
	cp -f $< $@
	chmod a+rx $@

/Users/polster/.netrc: netrc-polster /etc/secmaemo /etc/secgithub
	rm -f $@
	sed s/secmaemo/`cat /etc/secmaemo`/g $< | \
	sed s/secgithub/`cat /etc/secgithub`/g > $@
	chown polster:staff $@
	chmod og-rwx $@

/Users/polster/.hgrc: dot-hgrc /etc/secnok
	rm -f $@
	sed s/secnok/`cat /etc/secnok`/g $< | \
	sed s/sechom/`cat /etc/sechom`/g > $@
	chown polster:staff $@
	chmod og-rw $@

/usr/local/bin/runterm: runterm
	cp -f $< $@
	chmod a+rx $@

/Users/polster/Library/Preferences/nsmb.conf: nsmb-conf-polster /etc/secnok /etc/sechom
	mkdir -p /Users/polster/Library/Preferences
	rm -f $@
	sed s/secnok/`cat /etc/secnok`/g $< > /tmp/nsmb-conf-polster
	sed s/sechom/`cat /etc/sechom`/g /tmp/nsmb-conf-polster > $@
	rm -f /tmp/nsmb-conf-polster
	chown polster /Users/polster/Library/Preferences $@

/etc/nsmb.conf: nsmb.conf
	cp -f nsmb.conf /etc
	chmod og-r /etc/nsmb.conf

/usr/local/bin/mkdmg: mkdmg
	mkdir -p /usr/local/bin
	cp -f mkdmg /usr/local/bin
	chmod a+rx /usr/local/bin/mkdmg

/Users/polster/bin/enter-proximity-silva.scpt: enter-proximity-silva.scpt
	mkdir -p /Users/polster/bin
	cp -f enter-proximity-silva.scpt /Users/polster/bin
	chmod a+rx /Users/polster/bin/enter-proximity-silva.scpt

/etc/profile.d/macports.sh: macports.sh
	mkdir -p /etc/profile.d
	cp -f macports.sh /etc/profile.d
	chmod a+rx /etc/profile.d/macports.sh

/usr/local/bin/restartvpn: restartvpn
	-mkdir -p /usr/local/bin
	cp -f restartvpn /usr/local/bin
	chmod a+rx /usr/local/bin/restartvpn

/etc/X11/xinit/xinitrc: xinitrc
	mkdir -p /etc/X11/xinit
	cp -f xinitrc /etc/X11/xinit
	chmod a+rx /etc/X11/xinit/xinitrc

/Users/polster/.nsmbrc: nsmbrc-polster /etc/secnok /etc/sechom
	sed s/secnok/`cat /etc/secnok`/g $<  | \
	sed s/sechom/`cat /etc/sechom`/g > $@
	chown polster $@
	chmod u+r,og-rwx $@
