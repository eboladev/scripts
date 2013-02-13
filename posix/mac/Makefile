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
	/usr/local/bin/locchghook \
	/Library/LaunchAgents/com.macosxints.locchghook.plist \
	/etc/smb.conf \
	/Users/polster/.ssh/config \
	/etc/profile.d/aquaterm.sh \
	/usr/local/bin/ssh-askpass-mac \
	/etc/profile.d/x11.sh \
	/usr/local/bin/git-diff \
	/var/root/.ssh/config \
	/Users/polster/.bash_profile \
	/usr/local/bin/join-quantis.applescript \
	/System/Library/LaunchAgents/com.pipacs.resetmountmyall.plist

DIRS = maczok marzipan filemon

install: preinstall $(TARGETS)
	-for d in $(DIRS); do (cd $$d; make install); done

preinstall:
	@if [ `id -u` != 0 ]; then echo "Run make as superuser"; exit 1; fi
	@case `uname` in \
		Darwin)	;; \
		*)	echo "Run this on a Mac"; exit 1;; \
	esac

/System/Library/LaunchAgents/com.pipacs.resetmountmyall.plist: com.pipacs.resetmountmyall.plist
	cp -f $< $@
	chmod a+rx $@

/usr/local/bin/join-quantis.applescript: join-quantis.applescript
	cp -f $< $@
	chmod a+rx $@

/Users/polster/.bash_profile: polster.bash_profile
	cp -f $< $@
	chown polster $@

/var/root/.ssh/config: ssh-config-root
	mkdir -p /var/root/.ssh
	chmod og-rwx /var/root/.ssh
	cp ssh-config-root /var/root/.ssh/config

/usr/local/bin/git-diff: git-diff
	cp -f $< $@
	chmod a+rx $@

/etc/profile.d/x11.sh: x11.sh
	cp -f $< $@
	chmod a+rx $@

/usr/local/bin/ssh-askpass-mac: ssh-askpass-mac
	mkdir -p /usr/local/bin
	cp -f $< $@
	chmod a+rx $@

/etc/profile.d/aquaterm.sh: aquaterm.sh
	mkdir -p /etc/profile.d
	cp -f $< $@
	chmod a+rx $@

/Users/polster/.ssh/config: ssh-config-polster
	mkdir -p /Users/polster/.ssh
	cp ssh-config-polster /Users/polster/.ssh/config
	chown -R polster:staff /Users/polster/.ssh
	chmod 700 /Users/polster/.ssh
	chmod 744 /Users/polster/.ssh/config

/Applications/BuildTerm.app: BuildTerm.applescript BuildTerm.icns
	-rm -rf /Applications/BuildTerm.app
	osacompile -o /Applications/BuildTerm.app \
	  BuildTerm.applescript
	cp -f BuildTerm.icns \
	  /Applications/BuildTerm.app/Contents/Resources/applet.icns
	touch /Applications/BuildTerm.app/Contents/Info.plist

/Applications/Start-CM-Synergy.app: Start-CM-Synergy.applescript Start-CM-Synergy.icns
	-rm -rf /Applications/Start-CM-Synergy.app
	osacompile -o /Applications/Start-CM-Synergy.app \
	  Start-CM-Synergy.applescript
	cp -f Start-CM-Synergy.icns \
	  /Applications/Start-CM-Synergy.app/Contents/Resources/applet.icns
	touch /Applications/Start-CM-Synergy.app/Contents/Info.plist

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
